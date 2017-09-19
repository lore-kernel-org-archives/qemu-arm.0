Received: by 10.223.172.38 with SMTP id v35csp5264571wrc;
        Tue, 19 Sep 2017 11:48:51 -0700 (PDT)
X-Received: by 10.55.166.73 with SMTP id p70mr3414434qke.342.1505846931777;
        Tue, 19 Sep 2017 11:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505846931; cv=none;
        d=google.com; s=arc-20160816;
        b=UrZ/46pvYQEi6zrHaqF59vaIXfYLM3Ps5Lfmnlcczp75jKR5ZDTqvQVcNhz0VpDCXs
         vGpddXV0cIDxjlMpNvD8YGq9KHOYw+RXEerWBXUKJ6tgIvQPJ4OLk11y+LDGNJouf6n2
         4R/se2/fKPrH28VjF6YQ8KPI7Opwig0Qg1n6gD4Oz0VWxBhyyOYuYfdgaUdSt5X/ERHZ
         p9F9jUXaQLSflSyht66u8RkbbWzTUz7Y72n264frtoCUMSKC5HO5BtbLhWMqiArgJyrw
         pxtVIvJWejhq3CLb2t3i03Ptk8W1lDOX2rqb5y7KKJXko0cy1htx0nf97jL5EzAU/lSI
         CYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=O1j90dNY3tJbC2K2spNvPiospWeVguR32mP9i5A9vvM=;
        b=wqV4YmyTrOXawNDUYmEOd16LupVHMbt/5acKrFC3y70Ga77Xf5Hcm3RhL7Ys/KsHP/
         GoHleYs/ykdcluyXOi9B78dKHzC3VCd8UB91Enq0sEIrpe1vGdX1lvxXSpq121rjA54t
         IZ9VGvdC2Hztpm+w3l/8xiyQOlJEyYaKkwQ7zib+KB9TbhnjJNffhsum5fWu9sD+7Rvq
         9l3XBPVppub+Wa0aRwHIy3CAtGwVU4QAFz6T/RvacxQA13INusIYfbySxa13tV0u6x/+
         vHGsXVUvTcy3tHkGdM07Fq0ACwNXO3NCM0x9K6lhqk+OPZcjWwkbLW/7XvmWfV0dstWC
         akEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a5iFy7us;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 17si10447456qtd.441.2017.09.19.11.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a5iFy7us;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNZh-0007Sa-Fz
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:48:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNZW-0007RC-1Y
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:48:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNZT-0005ZU-4a
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:48:38 -0400
Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231]:55200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duNZT-0005YX-0M
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:48:35 -0400
Received: by mail-io0-x231.google.com with SMTP id h66so1297517ioh.11
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=O1j90dNY3tJbC2K2spNvPiospWeVguR32mP9i5A9vvM=;
	b=a5iFy7usOWCVoy3yuudzy7F/sFDAbRzxFdYTEqqsWpob6aNId+0AABSaECJ4XFzODc
	jvh8q9ElrgD1rdKuhXWqzh+Bt7YDfIROzltaIV2qEjH4wLab5TUshZ3EToCumDuGuEYD
	VfbQArzGRz/ZqW7OUMDzKkgEFZvm8qpWVNKz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=O1j90dNY3tJbC2K2spNvPiospWeVguR32mP9i5A9vvM=;
	b=jGEGb+f9gjpZK15tV6wa6g1gdhTmRuTjXkYCJQyr0iLGlhhsGnE72raC/wH//7kIF0
	/5uZnNejWf+KzhPMNwORQi3gICZ9FT8oWkNPrCeyAX7dDtPNKc2K3IdHjMHLOoIOu9U4
	tCJj8EnslZwWRuT0OpOu99OKzTZ01qS+eeIYZKCUyX3F916v4cAy6pIIJVGorjgpuBHQ
	32W/vTU6y0YTOTTkHJz2IBmRdlP/o7gMrRkFPo19kZTG2LVQtx93hy29Kt1uvBjPrpVj
	zcIPkb6cC87ubdm/8DN+I7g1cvXGS+UupO51cjj3bPn4ZvPHcBVBNhrUn6RohgJ519CD
	e43g==
X-Gm-Message-State: AHPjjUgb0tT7g5uWPruso5hklqE2ozHlg/AvH5RkqWnU8sKtrbSojn4s
	jqw+avEmF+sr1gfZe2nsXOIZFg==
X-Google-Smtp-Source: AOwi7QDYEQntxIJEn1FgcCCMMGRIzG6pf0o3LF9cFVsytedVdL6T2HkLJTMBAH+IIHyDRg44FcXddw==
X-Received: by 10.202.77.4 with SMTP id a4mr2448748oib.70.1505846913256;
	Tue, 19 Sep 2017 11:48:33 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id e17sm642606otj.15.2017.09.19.11.48.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:48:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-12-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e3a6dd4-9b8b-b2c6-723a-5867167b1272@linaro.org>
Date: Tue, 19 Sep 2017 13:48:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/19] nvic: Compare group
 priority for escalation to HF
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QI+wldEOR+D0

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> In armv7m_nvic_set_pending() we have to compare the
> priority of an exception against the execution priority
> to decide whether it needs to be escalated to HardFault.
> In the specification this is a comparison against the
> exception's group priority; for v7M we implemented it
> as a comparison against the raw exception priority
> because the two comparisons will always give the
> same answer. For v8M the existence of AIRCR.PRIS and
> the possibility of different PRIGROUP values for secure
> and nonsecure exceptions means we need to explicitly
> calculate the vector's group priority for this check.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


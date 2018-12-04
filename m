Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8097709wrt;
        Tue, 4 Dec 2018 05:59:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WAMWu5lfgpMDlTMjr4Os+T3cR8s0BRaFPkrkRpCmF2mlkBbT9+g/hQCmDlR2Z9yGiuLqkQ
X-Received: by 2002:ac8:25d0:: with SMTP id f16mr19857850qtf.129.1543931952557;
        Tue, 04 Dec 2018 05:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543931952; cv=none;
        d=google.com; s=arc-20160816;
        b=Ma6ooTwsQdeq2glGW8TWfL4znFYV74X8Khm0PUbEE+k+JgpCjswUpT8yCC5ooJLGwd
         KrDALZUnW01YgDD7/D17WPKjK8pQ4OgzlmHUTCvauJtzI2dUSnYiSsTAfPm2tTzzVC9I
         R3pA1rMnAbUdoX1ZldncQCBAf7zupdWibzJZJKqgQnBq2ZmUPVmWfcMR6IZc3bNdUjzg
         bKcDxL+Gbmy5/4qy1gV8YDwd6prSIIVZQYIMT1spwITC1P+4OJVNIBOGObpP7p5idXDI
         PuA1ZP7+1Fotzkrm80+FumXPsaxU3C5Rhd1B8FHCkc5n8+eaCZWw8snhuKbJ6y88NTeG
         aFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=99zJlufqPKASXYnlQiJzjssKX/aSwqI9mBYp3QThJLI=;
        b=IXhT+JqJOt6BJ++4jmh6lcPDn+tTXdaQsH61pRVSNvWpEaeCD9CG48+5aXt5ymlt1T
         nE/h/7A8MMr2Ps0gQ3u0olMaVrU+BS4eQBIpUwltmuzhDu45gXGpHZtJSi4awDBnl8v5
         9LNU5PpUnIhyz0yXF/uvHcJIOVMefbAVmA1KW9Fv4QLHvbIYcK5i4c3KbnheaBKyFBhq
         SEDfFxDNPg7nXx1Yp61ywCtO2P2f8WenIprbxbRh7b9BxCJdSTIfhB2j5Dk6zr1Erz7P
         yEMfo03SmnKTzr9F5Dm/UIHvfmAF+Nv2T39ut1smcD97a+6i9a/uI/4q2YvYqA7xqRCO
         nM8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TSYY+a+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u48si6216215qte.81.2018.12.04.05.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:59:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TSYY+a+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBEG-0008OO-1U
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:59:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBE3-0008Mj-Ti
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:59:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBE2-0001EW-8v
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:58:59 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gUBE2-0001E2-2Y
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:58:58 -0500
Received: by mail-ot1-x342.google.com with SMTP id n8so11353332otl.6
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 05:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=99zJlufqPKASXYnlQiJzjssKX/aSwqI9mBYp3QThJLI=;
	b=TSYY+a+zAbm5OgzxV+A8YnlkUZ2MN77u9oxgV5rsvml2Idp0zpeqnUEzVerhyFVcQ8
	eYl4XQaDBn3Qk9ddQbcuj09Lx41nx676Db5vmG3KBw2+/BLGsAQRtOIrCh7KJSocVk5S
	nV/m5940z3/JBZ4Ms469eJckKVfIyYK6KQgQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=99zJlufqPKASXYnlQiJzjssKX/aSwqI9mBYp3QThJLI=;
	b=gp1XgosxjU0xxmZRrazr2PRNm2CVWDCmp/xkCBx3plBYKcgkYSieMcJsnrlWNq4wPW
	FNuzHeGnEx2HrZGhY6b5Ashx9kR0M8Cp0PH+hqQNClr/s+mOG4+8nk78UBogiWpdf2f8
	GPb89NlPuJ5OFjfkj3CZdGQ8sdD21n9vsL34d6Z+iAqx9emrxX+f5d8rbvrDtH6JDHtA
	sELGe6mTFKRrGUkRgBWy6C15AptrSSvDqP2oj9WHAZgcLoZP3dTYfqqlkjXD5EgPieWp
	A247+LttnUBJ/9P9+FqtNXWACRUfRckw+LLaof5ysAJGiQcbcot+ex8tX0SJkA8z8Yts
	LnMA==
X-Gm-Message-State: AA+aEWYv6ts37pmUYjEj+YmyZbdGbuT8omtc3viUfZq9T+tFLA3jo6WD
	X0IH5HqS8VQbEGneHx0oCIcFpQ==
X-Received: by 2002:a9d:2007:: with SMTP id n7mr11764486ota.157.1543931937482; 
	Tue, 04 Dec 2018 05:58:57 -0800 (PST)
Received: from cloudburst.twiddle.net (172.189-204-159.bestel.com.mx.
	[189.204.159.172]) by smtp.gmail.com with ESMTPSA id
	n185sm6784306oih.18.2018.12.04.05.58.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 05:58:56 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <36d844d4-7382-3eef-b88b-9accdde7727c@linaro.org>
Date: Tue, 4 Dec 2018 07:58:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/5] hw/sd/sdhci: Don't leak
 memory region in sdhci_sysbus_realize()
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
X-TUID: lR+iHgsPgdPU

On 12/4/18 7:29 AM, Peter Maydell wrote:
> In sdhci_sysbus_realize() we override the initialization of
> s->iomem that sdhci_common_realize() performs. However we
> don't destroy the old memory region before reinitializing
> it, which means that the memory allocated for mr->name in
> memory_region_do_init() is leaked.
> 
> Since sdhci_initfn() already initializes s->io_ops to
> &sdhci_mmio_ops, always use that in sdhci_common_realize()
> and remove the now-unnecessary reinitialization of the
> MMIO region from sdhci_sysbus_realize().
> 
> Spotted by clang's leak sanitizer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/sdhci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

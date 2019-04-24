Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp29007wrx;
        Tue, 23 Apr 2019 18:29:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaPpZrWARhpmOVnBdL3CuPt9pM2nZCFW8nRMceMgDlcbzcZ3jU6U47pUtZWoFoqvfM6qAy
X-Received: by 2002:adf:db0c:: with SMTP id s12mr20107659wri.184.1556069381877;
        Tue, 23 Apr 2019 18:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556069381; cv=none;
        d=google.com; s=arc-20160816;
        b=uBPwX8G0kqRTB9YY022aN8hMAWXg6LHCwiNlh2jn93Mc2RYnXk0QB8Z/ZjWqoKKIVj
         qz42V5TKAOqRpoOKqyTQVuE218+EyB9sCree8jvBZ9Y8ChcvgnlwzoUS0vEei3tUYUrv
         n66byiaACs2/vRVrHUkJS9BYfRhRt8DLxqe/mOQ+dQc/tNt2jOMf1RCNLXW1ko+56hHv
         jyyiYEQwdbntfIl24ujkJENYxdHB3wWwWWIM13ScjK8nONkNL4MEVrAI3GxvZflJM4lQ
         t2MHW3uIv+xZ5hKBk4Q/7PtJEIIfQ5NeK5KneuRxWGofIQVcEliCPQmwznVI22yXMKvp
         MaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=q8TwHAD9KwFnBIO0KaXZmx6DPy4UhsaMneZio0TCMM0=;
        b=eJl1NLxpfgj1c4dPqTBUHcPNexGOJRHoldjHVNv4cbxkL6Aj+HZ6YZ1jVX+eQWUSqQ
         ceiGXX40yzreu2co9mi34WAAp+ZPO9pq7/RkirOI55O0sviHaQR8/+FZ4aEKBvdMyqvm
         j8yzY6rski74mgJbzSePaXqszq5FFwcEhrzZujlLLDp9+eXlCfF+DwdaQiUCai5c1Tz6
         Oaj0KetwS+5frb+e7hYjo0sj8Ef3N/04JLQRIrFSUsCArDU2LOaVQuPTAkbA9SBkISyu
         nEND9RVMtIbzt3YBgKm3tyBVcYmuRTRE5DOI6cEXK2O+qbIn6ubdnmR5Pv83Gmw7OcOO
         BnYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HgcPb5y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si12862974wrw.287.2019.04.23.18.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 18:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HgcPb5y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ6jE-0004VW-VM
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 21:29:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ6hb-0003PB-Fi
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 21:28:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ6QM-0000fO-Ei
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 21:10:12 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ6QM-0000cQ-2g
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 21:10:10 -0400
Received: by mail-pf1-x443.google.com with SMTP id e67so515376pfe.10
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 18:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=q8TwHAD9KwFnBIO0KaXZmx6DPy4UhsaMneZio0TCMM0=;
	b=HgcPb5y+fII6sdy5gQ98Vqi8AL/ItOmU5uIdaRDhux3BQTeq6r4+j7+/BhtZ4TVUma
	XIMeESzQo9QIRv/kIzJAq4OeVeM9hq+Vo562UD8BefB/w6eKi2DhTD5n5vgwYC0awAq/
	RFrrWZJ2qcCHNR1cicYjNsJSmfhDisfF+zTxP8/EKMZpMdJofyQ1GfDoJNGd3+I2Upt8
	98tDcRZzjeGof8aOJsjdeUidorzWvp2kNjhecNelaMJHiQl8BqLIm6yWyaFKOxuu90rm
	2fMw2uCa5RF2SNYGoKfwy8Fm0sUPXaVs6WRtlBfkgmUE+lN/AMVQZ8/0SE8TJKaUdBDB
	9ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=q8TwHAD9KwFnBIO0KaXZmx6DPy4UhsaMneZio0TCMM0=;
	b=UdQaqHzBu3vRtiJhuqfMx0j0zPKZ3LTS7i5XIXRPJ0rOW6MGy2O15Lwn6jBH1UBQ/Z
	d4tu3jedOKNhLNX7tfnIeusHwIFPOzwgq/cFjyl9Xzkkn8e3n8FmPdpEs622fiyf9gau
	7yp9HmdhBhK3sGC9FrYz5xvDFsRxmXNCkpaWjvCXNuaM4SyHVOy9eJmP/7jAGHp8QVBq
	KSJIUk/ld8s5GsowYvy6Blyf62jt58CSIas2JM5DMgNvPX4RpY/CNeYw3v9lBaJVb7Sv
	UzOB56BbTVVArHtauVC5XtmzDYKgH1xUVK2Lt6o+BdcFhZmrD6H66b/yTXmYDzRC8L7+
	jYQQ==
X-Gm-Message-State: APjAAAVzaawmg2tvMdB/NrM0VJH7RVyGlS3JsYblbPpcGUBPgDqKgybS
	RrujBLIL6mL5iZFSJWmvxngkqA==
X-Received: by 2002:a65:6546:: with SMTP id a6mr3987527pgw.5.1556068208672;
	Tue, 23 Apr 2019 18:10:08 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id l1sm19665052pgp.9.2019.04.23.18.10.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 18:10:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8ab80d37-fc52-55ba-71b1-635a535f6c5a@linaro.org>
Date: Tue, 23 Apr 2019 18:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 21/26] target/arm: New function
 armv7m_nvic_set_pending_lazyfp()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zIVaXC+5nGft

On 4/16/19 5:57 AM, Peter Maydell wrote:
> In the v7M architecture, if an exception is generated in the process
> of doing the lazy stacking of FP registers, the handling of
> possible escalation to HardFault is treated differently to the normal
> approach: it works based on the saved information about exception
> readiness that was stored in the FPCCR when the stack frame was
> created. Provide a new function armv7m_nvic_set_pending_lazyfp()
> which pends exceptions during lazy stacking, and implements
> this logic.
> 
> This corresponds to the pseudocode TakePreserveFPException().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 12 ++++++
>  hw/intc/armv7m_nvic.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 108 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


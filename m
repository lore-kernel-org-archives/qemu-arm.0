Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp206486wrg;
        Thu, 13 Jun 2019 14:24:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6rCcVSAg8HN9ihGo78vWJnO5mXwN2BLIqhWm2qqsrjTktIzeHOU5OIhQBmVJjSIUL3nn6
X-Received: by 2002:ac8:32e9:: with SMTP id a38mr79232409qtb.245.1560461045122;
        Thu, 13 Jun 2019 14:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461045; cv=none;
        d=google.com; s=arc-20160816;
        b=nw7djID2achXe8crG88fOyEQe3Lr2YvtNwvk7Y+QhZskQLiuquvcVOhTv+9F1X4dgs
         Ct4O8QYqm8zAkZbhLS+mHEFzKBpv42ePb/OR1qByAxZ6ija/OPbt0jXEs8PJhvGuHMVh
         RzRtVv8A4r1T5HrIxQW8SJbS+I7jkr4QIWryMXw0rX8DfEsQWbtAfXev2071fZljU5Jh
         Lf5awgZQ6fzVOYL7cRkKTw9zzMyXObIWpcCUcQlfbPacIg7cOxsJb64GoF542uvYI+Bn
         tZ7sb1Hr8UDn+ZOtQlmLSQn+rElJzwEjjWPdaeVQOCHZmG47mWJXCBbdR0zHkas45OdQ
         CW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+PhFHDqEdtLwS/tvs7fSztDQszEBBsq7OUkTnqZnXXQ=;
        b=JOu83f7or1TIA12GQM7BWTP1nTTN5h9TO09QYm0inK4Abul2xsFlRWzo1U8azViQGq
         4eQTKU9hopk9xg/fHQfPgeKfVYh6kC3XLcn9rwXxf4xyAePYdmFKfvaUsByOTfiDpa60
         DYMcKS30g/LoBrq++/5mSZbHu7TDoZlb2bYvCOj/2/9dimMmTYybM1lk4ElSna22YEpm
         hnVOnFWNJED/Q2HvQyy0k3WXB4DurWHGgeL5SOEjdjBwHQJya9eLMXaxNdDbO8zKVx+w
         iygm0P+rbGKpbKavMgDd04asEKgjcKk9qFQMkkCkRfk8cq9O7faPLMnuQHDVaTAuM//t
         5/+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KOeVJ7IV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si442678qta.234.2019.06.13.14.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KOeVJ7IV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXCW-0007CZ-KY
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXBy-00074h-Vk
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXBw-0006Kj-Rm
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:23:30 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXBw-0006K0-Lv
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:23:28 -0400
Received: by mail-pg1-x541.google.com with SMTP id s27so236724pgl.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+PhFHDqEdtLwS/tvs7fSztDQszEBBsq7OUkTnqZnXXQ=;
 b=KOeVJ7IVKOEgGqvaz+NwIQIDpyXyXj6g4JTI9tktoE58AzY7OnVcj7guaZvk0Ny+TO
 K1DYmdGxVQowgZFhiK+5P1y5xlc0Pscs5R0Y12Lq7wwvaaB9bUdvi9PG/VYKxnenOV5T
 hp3RMEMcPqN+3BIRx99yWmPlJ4MRnvtcZ5WyIyO0venGCAuD/9/kXv3meBeBpKgsqQfb
 XM0MHMXeZ+ZTrsS4eHWZu8UyN//w5RxlWL9cnjuEEmG1zG0+drDvLKbfCzT8i4zeMOv+
 tk2WhQ4b9I4g7Hq4GsJ0ePRHwV3JoSp/MQTwFR8d2V6IQdZ5xvSDNOpA4iIdFOza1Hbm
 1w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+PhFHDqEdtLwS/tvs7fSztDQszEBBsq7OUkTnqZnXXQ=;
 b=mkdeuVauNNfyKfvB6gtvf3r88yeZUgkGFyz/tf6DVaIefvwrQ9WFL0QDwod4q9HEMj
 9htBXYV5DTgiDIrTk+3eJH/RGOEOjLo4jinRjqdgRV+FD5aJaOVPSRJXG3LjfT9VdO0E
 7/hZWd9ecvQBk0umB+gcr4cUUE0/WDWPRUh3RTKuogF5VbyE+q/IH1Z1E9Slo3w0mHwA
 +nP7L2oJPb2CRZnWCiDkVi3r5ORk+dw+F8CfIWBs8Hlj8Qcay0bg/+03uFj1L668iH6h
 GHiYgbfIlxLlhxgazlnSmQqXTQP8EFA7Ej3OQYeT1NhM8h305CNEguzJDs+C9l55MOHM
 yDBw==
X-Gm-Message-State: APjAAAVPAZDkkR5Bg1hn23NBsp8941p5J8fyXY4NGkWJbS++nzsOUGzc
 LMyXNmCqFEmGS5wpY6O2yoCfifVdshM=
X-Received: by 2002:a65:624f:: with SMTP id q15mr32315936pgv.436.1560461007244; 
 Thu, 13 Jun 2019 14:23:27 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id b128sm593016pfa.165.2019.06.13.14.23.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:23:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09f6f0a2-2964-fb95-d099-e3f06b14d824@linaro.org>
Date: Thu, 13 Jun 2019 14:23:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH 02/12] target/arm: Use vfp_expand_imm() for
 AArch32 VFP VMOV_imm
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Aa3VjdzIWmna

On 6/13/19 9:39 AM, Peter Maydell wrote:
> The AArch32 VMOV (immediate) instruction uses the same VFP encoded
> immediate format we already handle in vfp_expand_imm().  Use that
> function rather than hand-decoding it.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 28 ++++------------------------
>  target/arm/vfp.decode          | 10 ++++++----
>  2 files changed, 10 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


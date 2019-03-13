Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1862373wrs;
        Wed, 13 Mar 2019 09:51:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYMcSEUtWyVDbme72n3qhQiDtHsrBD1DgBcJtnEhMdobm2hZTWVKTyMSWQsKMzuxnp5oYX
X-Received: by 2002:a25:ce81:: with SMTP id x123mr31799371ybe.355.1552495880591;
        Wed, 13 Mar 2019 09:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552495880; cv=none;
        d=google.com; s=arc-20160816;
        b=qRrcaDXnEq6kpvKQw3qBCTH/BbkqznGZkXP1BrigDIQ13dhlaNtrVSlInkI4LLoRNc
         OPjmFT0sht6dCz3AHxZMia1QoqqnWgarpvfkR9+hRfxkbnlKwcWLmwD39bMowLNbj30L
         s6EN95ZrT6pkf6E1MBXjfp+zhRQ3hi2pR2LGpDuCE2TGhlGmX8++E4erJLhC1S55RcQB
         cOppnNA2I9bKI4iPbmoTR9qbie12Id2YDfcKqZqbeb4PrYlz2ZUreXDYqTSydhSevvbM
         LsedJgYaCyoeSTZ/TdKzVGmaKsxWH8SmuuE2bojM5B8CKH98o3NlvYou2HWn1v70eGKB
         spvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=wASWyEpjwlsDBQYNquWXvhS+fA34Hy2BUNMFbUBmrBM=;
        b=xd2yvUwuV1+lFIqzJsJuPdNH+7Zw3IrvcehCP9TZWwX5TVQR90QVnqK86OwchaaA7f
         DHE28th0ztpBsiNhUofeA32D15nmCsGyZUEKQyU8y7cU54ntFjwijhUZM66ZvrNLKJ4p
         7M1F05Sh13rDBxDtuELt3LmFJFl/ypRutEeIQCl1wAM9ZOz4z2GX8ovBuSzPJlhIBNm9
         zyZjMghC++nynp+G+4lpgDqfP0pl+69KTCQvGDvB0CvcOsIs+26B5BS3Ci+A73Yzbzh+
         xzHrkWgfRwBYW1Qw+cLc4frI+qwWtx8BcOv/AjncbE41DaeS6zLu88stngYg2skqoddZ
         dOXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VwLq8chY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123si7047493ybr.301.2019.03.13.09.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 09:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VwLq8chY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4768-0005gr-1C
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 12:51:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h470P-0000pT-Sz
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 12:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h46q3-0003Ql-JL
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 12:34:45 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43103)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h46q3-0003Pv-9z
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 12:34:43 -0400
Received: by mail-pf1-x444.google.com with SMTP id q17so1742410pfh.10
	for <qemu-arm@nongnu.org>; Wed, 13 Mar 2019 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wASWyEpjwlsDBQYNquWXvhS+fA34Hy2BUNMFbUBmrBM=;
	b=VwLq8chYXLBgI5tkuY3LdCOa01YgyA0GAeG3RaN39dEvktuM2P5kUA/WbknmN8O2Pw
	C7thk90q7fF46QQmjocHkjBOl8dAAkbATriOHBje/70CYTIjUeWc2kLTDwO5zw2u1ktP
	x7cpMu/WyIvpP2AubS+xXjq4sC4rlJtkYmnaJYE3Gce3yV6NrxEMD88zdvSkhx6BR5Zz
	rWIvTQQvQqS1niuihZcPjnZJOfpQpWhigyjYaUDxFsvXDyivkC7+quWJxr8GDPtpsaA0
	GSqdtI1EaJ8LgL/cRRVeplZ1f0/it8M1kPwQ4RO+GS7FEB1cPPCj+Jfb9aVNc09dsHCd
	wsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wASWyEpjwlsDBQYNquWXvhS+fA34Hy2BUNMFbUBmrBM=;
	b=Sk1CFksHhhCavjtZQimOd4gEteGk4O+CXLgo7TkjyeWOk9RmhGdBdYBhVWbvohWMoV
	WBX8TvoC/Z6nqzkLeeLcbAmlb/xueaVW4L3b57qrh/bl8/foZ/lpDSZoPWLugTHVupRO
	LL6v8s11amQUtreEUzL14dQWLa8Y/EdDwzFJsXfFxHC0EW78IwLJerH7MLVJI3X4Gbpi
	3l0Zng1BOe3Ara+bd74wtq6EohXIBx5JExzRsUmrWVcdRuMrcv0NoYwc/aYzYyVyisuc
	HfzdaDKaT5NpRxm6YizCGwKVRkpolUtHJ1sKwrqdPcXjyE74+PgGbfzj5YoULe7Er8/S
	du8Q==
X-Gm-Message-State: APjAAAUnZTEhi4Bd9Z3fHxIFThDC7Y4Uk8cph4Yqb25ex6Sv7KKGAErS
	KdUpGf962ddxlrVWJ8GMB87H3jFwlyQ=
X-Received: by 2002:a17:902:aa0c:: with SMTP id
	be12mr10538981plb.63.1552494881365; 
	Wed, 13 Mar 2019 09:34:41 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	y8sm24792321pge.35.2019.03.13.09.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 09:34:40 -0700 (PDT)
To: Amir Charif <amir.charif@cea.fr>, qemu-devel@nongnu.org
References: <1552488086-4025-1-git-send-email-amir.charif@cea.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0d61f67b-26b2-33e0-cf4d-13c7d998eed8@linaro.org>
Date: Wed, 13 Mar 2019 09:34:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1552488086-4025-1-git-send-email-amir.charif@cea.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Re-evaluate SVE vector length
 everytime ADDVL is executed
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h6oIuspcvOsz

On 3/13/19 7:41 AM, Amir Charif wrote:
> In system emulation mode, the kernel may internally use 16-byte vectors.
> If this size is saved in the DisasContext before entering a userspace app
> that uses higher SVE sizes, the wrong size may be allocated on the stack
> resulting in corruption (segfaults in user space).
> This fix evaluates the vector size at runtime (as opposed to translation time)
> to always allocate the correct size on the stack (when ADDVL is used).

This is wrong.

In particular, if the computation of VL is wrong for ADDVL, it is wrong for
every other SVE instruction as well.  Most of which cannot have VL computed
at runtime like this.

That is why we break the TB at every change to VL.

Where do we "enter a userspace app" without breaking the TB and recomputing?
As far as I know this must have executed an ERET to return from EL1 to EL0,
which most definitely happens between TBs, or else no system calls would work
at all.

Do you have an example that provokes this failure?


r~

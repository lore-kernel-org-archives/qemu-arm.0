Received: by 10.79.209.37 with SMTP id p34csp723975ivj;
        Wed, 11 Oct 2017 07:15:17 -0700 (PDT)
X-Received: by 10.55.99.10 with SMTP id x10mr19692090qkb.112.1507731317592;
        Wed, 11 Oct 2017 07:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507731317; cv=none;
        d=google.com; s=arc-20160816;
        b=GiI5uvYAtQ+JTL/xoWKoBvWOCVrfkkE37ikte/pjVb50Kit/U0f1N5+HcQb13GCdhk
         UZCLQjj2oLuGjYEda6GhM2b9QXMw0cXnswOdHrAs1i4betZGjjUfxtIE2plYybi1NAPc
         snCT7FK6muywKQNpxGWTk7zFETx1jOI35uGIbZoWoNnFDv6+n0ohDiaH5gMnOFMSPz6Q
         54Dtb3brQuF4zoE/7pkCdI95DQtMqnm99l3RkmgTJ6RlyrFkO0+OPLL6r8PMDzOaa8m/
         giLiJQ06QOFFn2m2GHR4uTmnJixujZOHmoxgdv9aqNQtx1IdLLmrXdo+g+f04/ajJUWG
         1mWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=l/YoCk5g3GeBcONE4iJl03V21HQeCaH3TkIRkLDEj7M=;
        b=MdRU9f2lAEN2HPa3wI8a9pqEBt9B5I8c+TxU6VF53ck72vZ/jcL8M+awvHTbyyWtvT
         psP739A/kRbUU3fFYvFHQMpPx+Q5q+LC25NSub1XTDdlP4im6pBN5eErqUeoYZ89jCfe
         CLvrgmqmdQrYCFwBmnWKgfp0fMFk1WRrWSk35kMBihdnQkp0wYOrHjGSKzvtjj8muLEI
         apEGm8gEPYJc7mGI7ZDsq+6KY5HHBa58/paTYruLgm3U/QPGU7tT47+D8jMW96zgHjbe
         usNv5Rihp9KJJmaHRNcdvYy8uddqNrrBhAMUF/Ts+ShG9JdGIfIzAMbQtE4djCycZ+Ni
         FGQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XmgAr+3M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p48si1735252qtf.4.2017.10.11.07.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 07:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XmgAr+3M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2Hn1-0004Ux-IY
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 10:15:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e2Hm6-00046q-EV
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 10:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e2Hm1-00042V-Gp
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 10:14:18 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35825)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1e2Hm1-00041l-9p; Wed, 11 Oct 2017 10:14:13 -0400
Received: by mail-pg0-x243.google.com with SMTP id l24so2222248pgu.2;
	Wed, 11 Oct 2017 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=l/YoCk5g3GeBcONE4iJl03V21HQeCaH3TkIRkLDEj7M=;
	b=XmgAr+3MHsBK9P+BegEDK45GiA4IwCO+TUtxVWgtxgjZ76DTTBdBLlry82A3msqMkJ
	hcGGtvp7r6LDxA2hJv550q48QYojA1I3G8jlLfh4XJO3S+Kd8vz4e5Y0FZIOKfOUkyrX
	CRYaCWUGQQaNt+yueRtLBQ4g9YGBJo2pzYrFH9EiMIDx0fV6BJg9TKcy3dRBtpSeXnVR
	tx7OEE4hcA3UPUnYjH04g2DAxxCz0Wi64bGpM6uXR5NExhj9ELzyRxMlBs8IXekaLfIZ
	XfkEc9pFw6vW8bGTiS8refoiPuDSDH/BP6znxd876BMylHUBtSKUI5T9nVf2GrOnWPmi
	YF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=l/YoCk5g3GeBcONE4iJl03V21HQeCaH3TkIRkLDEj7M=;
	b=ivFhJMlcSIV8Nn2zwQSqy7XGEd2Uzsd4nIywDKKTGp1obX21yzCdxB8mEjFTCXZXiI
	L4OVKmVNcrX7NpZuw7cff+9cR9sN5vK0W60ASkMhmPTsFKuiJIL39Fg3kkY6P1F9SLqC
	QKITPstXZnDJj9/JO9SGbxkLiOQ6n6GUnj3EzZ9sE4K7Jhkq5mAEEaXAJQOgMIY8Tsix
	+UBS5FhJ2K72yo8z+fYLlKunz8B/m6JhMYx20vJ8FbXULfTJUGaVWRO+TbGixHxciTxH
	dM08eKZP4nlrj/TAKJ/5QLN9cjSuYzPaBpz2i242aPkwk9eXPUYT7lElE2DDiMceElYE
	U86A==
X-Gm-Message-State: AMCzsaVSzgWwd14ngEZLkzSxu8/sxTxXwO9crTxvhYGj1h87mjiTbRlr
	yftcFABTxDJo1YiQST3RotM=
X-Google-Smtp-Source: AOwi7QBlDKoHuJAsZHk0iK18yLsYCQOKR414HtT0DO6DJEGxQ2d8Y7aG2mCI5cz0o3IQ1GRnKF1bRg==
X-Received: by 10.99.96.214 with SMTP id u205mr15616377pgb.257.1507731250978; 
	Wed, 11 Oct 2017 07:14:10 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.googlemail.com with ESMTPSA id
	e84sm19062332pfd.1.2017.10.11.07.14.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Oct 2017 07:14:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-9-git-send-email-peter.maydell@linaro.org>
	<3bab968b-3476-55c2-ba7d-ffd2b902e532@linaro.org>
	<CAFEAcA8OzWu9KqA4MuTYst0o4K60wythCf0u7UuPHjp0q7NAxQ@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <24680aa9-fa29-821f-30ad-0a03b901aa9d@twiddle.net>
Date: Wed, 11 Oct 2017 07:14:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8OzWu9KqA4MuTYst0o4K60wythCf0u7UuPHjp0q7NAxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-devel] [PATCH 8/9] target/arm: Support some Thumb insns
 being always unconditional
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZtfRfojwYn1V

On 10/11/2017 02:57 AM, Peter Maydell wrote:
> On 11 October 2017 at 03:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 10/09/2017 06:48 AM, Peter Maydell wrote:
>>> -    if (dc->condexec_mask) {
>>> +    if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
>>>          uint32_t cond = dc->condexec_cond;
>>>
>>>          if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
>>
>> Don't you still need to advance the condexec_mask?
> 
> Yes -- that happens after we've called disas_thumb{,2}_insn()
> in thumb_tr_translate_insn().

Ah, mis-read the context of this hunk.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

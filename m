Received: by 10.223.159.74 with SMTP id f10csp2381452wrg;
        Mon, 4 Dec 2017 20:35:18 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZNesnWhrvTujNr4BSeMG11xaWwv+ZoGJ1dbsUV4AKUbTGCB0cpgLb131LwgdyHB7o1p9wW
X-Received: by 10.129.229.68 with SMTP id c4mr11631464ywm.503.1512448518247;
        Mon, 04 Dec 2017 20:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512448518; cv=none;
        d=google.com; s=arc-20160816;
        b=iTaI/fnOinmg59dkTHgt25JM8miXIEKP3XYtAUWdQTb+PaBXuGyodCcKtNOHGvlYIq
         vtdUIFrwOMxa+s5iP55IWSw+3vgOemQe7DJ2nXQVDbzxUrbIX70lG3anLVWJOoKnqRyG
         gUTCLtg5T+wPR7kApZKP76Bb3Qag5J8JSW0Y9mtxr44WoKksEsQ3IHT/dxshhtePSTGu
         7cAvzLi02lP6eMo00V8CQ3gy7517q4JAQe1TxGtuVnTXOmL67vGplJ14FTipWIaAtcih
         S3keItjMEQOd+VUwPNc3tP7xAqkDNifAaVv5dnNVje2fs4irgfHMdGQXJ8rZy0Xy+Kxl
         ap9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=yFq0fxwopJxOFZmLNGoIw7u8zJn2wfe/01yA2ABTK2U=;
        b=R75l/yg4c8CtTqtnHcbzuJ8Op5a8EEE3CsScpP1W0/w6+07wbmQK1pfE4Q0Z/omPF5
         /xRXnryAsfUSoPpFupDf/yJ9UqTPhnnwqWXS/Ah2Uv3+0OuzBx48JfDKn8lVbnAHnfuD
         azcqikeYjcocyRRmyzKOjaOs/mqvxTX8DLc/cJessiMFnZptr1M11AGz/bPBZYrNmrE5
         V8PCW2q0uukAEoCWlaLf7So+9WTPGkIDdZHTQ6IDuqSDIOFb0JYdu3rcLpykIfb8JUVT
         q22WOTKcsyuxa/nFVACoLWd+Sz4ZZpMTK81fmVvvOM1jzu5LQo7OytsmghPy5yCDSF+h
         KsAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p9dhLycV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si2773485ybo.678.2017.12.04.20.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Dec 2017 20:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p9dhLycV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eM4wv-0005Hv-M7
	for alex.bennee@linaro.org; Mon, 04 Dec 2017 23:35:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4wc-0005B3-1z
	for qemu-arm@nongnu.org; Mon, 04 Dec 2017 23:34:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4wa-0002xG-OM
	for qemu-arm@nongnu.org; Mon, 04 Dec 2017 23:34:58 -0500
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:36762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4wV-0002lz-0P; Mon, 04 Dec 2017 23:34:51 -0500
Received: by mail-qt0-x229.google.com with SMTP id a16so26318732qtj.3;
	Mon, 04 Dec 2017 20:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yFq0fxwopJxOFZmLNGoIw7u8zJn2wfe/01yA2ABTK2U=;
	b=p9dhLycVtXkaE1BEIDbZz8gPLY4cvDPmSSDVWuCnukEbfXJmYJTht32HHFYE7CcvRb
	7nswKvMx/uTV+0myIu268q/gcWmCoOIW/SJB9jxdGHrAxGR6BT6uUumwLOx4UKC/mqHK
	CxI8Ksg1/lp7O94F1OHqyxzCdm5Y9FuiM0Mg0uqiBNy8ZSCZYNx6rT8mB7WzsyHsTrQq
	KMgIWpqLIXn8DprjnMG83fMm+0SJ7naPA2Qqu/ZjqPV3NgCjQOgg78Sw5/YbgIS9N5D0
	ivruFmCdHooUjpEMTLpqAJqhOC8mCQOj4zjUDqnUoAHHJ6XICUi64yY3RG8Upoy7wd8L
	GiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=yFq0fxwopJxOFZmLNGoIw7u8zJn2wfe/01yA2ABTK2U=;
	b=BT97gyI1PsyKPVByo+NdEaxhXhtdnfpoSZK0U+qyq37oWtlAAz3/30sa6AJLMqM5vv
	aBeAQw/D1yH+HnDdhWgNmFZyMCTtm2S30IzfEwfIGsoQ00Qr7nR45e6Sh/03N7xb2n78
	wwnaXOAcXLg78lZ8cD5Xl6XYdIpHSepH3JVEO4c8O/+geU94FlyM1upq+7mOwptVfXmb
	8vl+3bKJKKENCrBNEzVIUJFGfcSn8pyITFnLp+UMTw3+lpwmA8RmTosdPX375ysDb9Iv
	GxSqE2gnF6UliYUOahoH2ddbLOuBVn09XY8m1TWkzdwVHxVgbxwFPSZSeS44/4I/Lp5s
	Sc0g==
X-Gm-Message-State: AKGB3mI3IBucE4tV8pSNL704C7ysJ6nksIyjsimAt8S90HihzCpGR93L
	eE6pAJmJ95Mf2lrTdlr/jkPy8c5M
X-Received: by 10.55.5.149 with SMTP id 143mr21317165qkf.298.1512448490130;
	Mon, 04 Dec 2017 20:34:50 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	o145sm9699823qke.76.2017.12.04.20.34.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Dec 2017 20:34:49 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1510087611-1851-1-git-send-email-cota@braap.org>
	<49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
	<CAFEAcA-pwxfR-+XSu+q117Po=Lh2aRDGtW9jNAEZuPZNjbFC_Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <26366f15-b8a2-9e87-30f4-56253ec6ca9b@amsat.org>
Date: Tue, 5 Dec 2017 01:34:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-pwxfR-+XSu+q117Po=Lh2aRDGtW9jNAEZuPZNjbFC_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-arm] [PATCH] arm/translate-a64: mark path as unreachable
 to eliminate warning
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, "Emilio G. Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Prdjp91q1Ihf

Hi Peter,

On 11/13/2017 08:26 AM, Peter Maydell wrote:
> On 8 November 2017 at 12:37, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 11/07/2017 05:46 PM, Emilio G. Cota wrote:
>>> Fixes the following warning when compiling with gcc 5.4.0 with -O1
>>> optimizations and --enable-debug:
>>>
>>> target/arm/translate-a64.c: In function ‘aarch64_tr_translate_insn’:
>>> target/arm/translate-a64.c:2361:8: error: ‘post_index’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>      if (!post_index) {
>>>         ^
>>> target/arm/translate-a64.c:2307:10: note: ‘post_index’ was declared here
>>>      bool post_index;
>>>           ^
>>> target/arm/translate-a64.c:2386:8: error: ‘writeback’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>      if (writeback) {
>>>         ^
>>> target/arm/translate-a64.c:2308:10: note: ‘writeback’ was declared here
>>>      bool writeback;
>>>           ^
>>>
>>> Note that idx comes from selecting 2 bits, and therefore its value
>>> can be at most 3.
>>>
>>> Signed-off-by: Emilio G. Cota <cota@braap.org>
> 
> Applied to target-arm.next, thanks. (It's a bit sad that
> gcc can't figure out that the result of x & 3 is constrained
> to [0,3], but there you go.)
> 
>> Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> By the way, Philippe, what are you intending to convey with
> an acked-by tag? Usually "acked-by" means "I'm the maintainer
> for this area and I haven't actually reviewed this but I don't
> object to it"...

I still feel new into the FOSS community and am happy to learn and
understand from such comments :)
Reading thru the list I wondered what means this tag, asked to some
maintainers on IRC and read the Linux kernel "Submitting patches guide"
[1] bullet 12) "When to use Acked-by":

'''
Acked-by: is often used by the maintainer of the affected code when that
maintainer neither contributed to nor forwarded the patch.

Acked-by: is not as formal as Signed-off-by:. It is a record that the
acker has at least reviewed the patch and has indicated acceptance.
Hence patch mergers will sometimes manually convert an acker’s “yep,
looks good to me” into an Acked-by: (but note that it is usually better
to ask for an explicit ack).

Acked-by: does not necessarily indicate acknowledgement of the entire
patch. For example, if a patch affects multiple subsystems and has an
Acked-by: from one subsystem maintainer then this usually indicates
acknowledgement of just the part which affects that maintainer’s code. [...]
'''

It is not obvious that the 2nd case is restricted to maintainer, but now
than you explain it I understand.

I intended to express "I don't think this is the best way to solve this
problem, however this is probably the best fix when freezed for a
Release, and since I did have reviewed this in details (and tested it)
but I don't object to it, instead of signing with my Reviewed-by tag I
lower it to an Acked-by".

Next time I'll keep it simple and use a R-b :)

Thanks to take time to correct me!

Regards,

Phil.

[1]
https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html#when-to-use-acked-by-and-cc

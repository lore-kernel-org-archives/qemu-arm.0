Received: by 10.28.4.212 with SMTP id 203csp1268720wme;
        Thu, 10 May 2018 10:09:56 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoUpuz0/nZqG2m5qvT/QewQThO8ARwssJlGoqZvVqNlYxXLw4DPe/mpvQeLReHbRxK59Fda
X-Received: by 2002:ac8:26f5:: with SMTP id 50-v6mr2194558qtp.155.1525972196138;
        Thu, 10 May 2018 10:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525972196; cv=none;
        d=google.com; s=arc-20160816;
        b=Pcdr9XdP1QGafg4W8QMvE7UHaVuCuap0zCVaM6jY20E1StcHLtyP1oltKlTbgokFPE
         xtUJsqu440I6h6dgGq1XvrG3ClqIlT1gGbpEagF2DeXgXLo2Lykar0q8Ce8+RFC03Jlx
         i+A2P0fEHUw3C1Htv9j7h2bqRmj2sPU5ajfr2e7OWQrYJzUF1U7FdW8qg/GzbbD4qLhT
         pXaiUbTazbZDfFVMI8pG38v3PsQbFIkmxAUq4nQXwXJ9hRoDo54mb1VaDQ2+ReMWRD5k
         NNfX3qRpKmNs9gzCLmW2Z0PZ0DeNm7daNNBa7XLm0c20t6tWL7Zv/GlbD2vnW3mJCiLC
         c0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=G0qC4jb7P3uGkTsE0rv4DGx35LyAuGaE4AOsjslhPgs=;
        b=q7TbAyWF3m7tHaBZCGaZ97neFBkc+YYnHUsenlMkZzkXvc/+7naCvytMJIPRsnOz1G
         OnwXM9DaLA1NJRrmUn/No6QLGaVVwFRzskns/WXdXRJ4woCkmpFiwCZfza4qGDLubv+W
         PXoOn9TJSnu9TLDoU7Cdn400deKRp8eUtwXmsc4dHxDTjWjgZFkj+z07/cRA+GxAomW7
         wGrESL255QZZ34YQ3HfTQ0XSTDTMuIshMxc4dbMHKPb76BfyEmD6+BoYbgUXohCDQT80
         xXNbbORJd7GBPXXasXYc4k3yBfCyK8OxJFU5IlXWhlhySiTjkjvNgYRgbXiC1yfxikL4
         KOvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0U0rI9p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7-v6si682460qtb.85.2018.05.10.10.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 10:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0U0rI9p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGp4l-0002U7-Ls
	for alex.bennee@linaro.org; Thu, 10 May 2018 13:09:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGp4X-0002Jr-I8
	for qemu-arm@nongnu.org; Thu, 10 May 2018 13:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fGp4W-00049c-Jc
	for qemu-arm@nongnu.org; Thu, 10 May 2018 13:09:41 -0400
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:45060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fGp4W-00049I-Dr
	for qemu-arm@nongnu.org; Thu, 10 May 2018 13:09:40 -0400
Received: by mail-oi0-x230.google.com with SMTP id b130-v6so2375868oif.12
	for <qemu-arm@nongnu.org>; Thu, 10 May 2018 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G0qC4jb7P3uGkTsE0rv4DGx35LyAuGaE4AOsjslhPgs=;
	b=G0U0rI9plv8tAgDeQpdXaiHwWwHWWrG4xLhqmFCK273D8bDA9cbhDPzX4mippjso8r
	nxq6xHGHL/1cMcRERL1ULfLrLcvqyECXwolCEu6JPVC0gkBvsNdjkCebmvOq6r9VMIlB
	UiwbJhn+q/lrsHRgrGats8MkuAZixgHr/+OkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G0qC4jb7P3uGkTsE0rv4DGx35LyAuGaE4AOsjslhPgs=;
	b=DfvM7333jgKvNj6Ep1JZVpPUhfro6XpO7ZWhU//3aBPCgGuNwR1PvMeikaXDSgeHBT
	cBrj3hx89+3rK6t6wycV8TFJRBkuQta6g6WNQgQUVDVuodn0J8Te5Y4vW92Q1+V48nqt
	IktxoS0tICJiwV/DfFK8P579wYviz18bW30pKGJlDRHLPHtcNT85UPbWUei2Nk+oTgDY
	PNaocoWQwo9oRnDzwuEvx0HRkyaabkAIjFYTh0foLlqi9Ms4aWBn9NNYfZKqOTaiCkaj
	AY5Ofcax475iN6PJKc3VFzXFSo5X+rXR2yM4j5brkfQ4x3dVGLgx/sFww4DwjVq/Unrf
	flzA==
X-Gm-Message-State: ALKqPwdvW76A9ajeGkioolxX1jVVEnr1fsUHZ+dmaoJxDA4UcMYP6mEy
	tq1dGDJqSptJUQkrB7WVEETZ3wIhMU8OFCPMmIuzIQ==
X-Received: by 2002:aca:538b:: with SMTP id
	h133-v6mr1327171oib.252.1525972179784; 
	Thu, 10 May 2018 10:09:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 10:09:19
	-0700 (PDT)
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 18:09:19 +0100
Message-ID: <CAFEAcA_wNfL2YqWB6xykyf2UbTjwViodUt8AvdRS+HA+RMssuw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-arm] [PATCH v2 00/14] target/arm: Fixups for
 ARM_FEATURE_V8_FP16
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kMiJqscDOJOd

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wrote:
> When running the gcc testsuite with current aarch64-linux-user,
> the testsuite detects the presence of the fp16 extension and
> enables lots of extra tests for builtins.
>
> Quite a few of these new tests fail because we missed implementing
> some instructions.  We really should go back and verify that nothing
> else is missing from this (rather large) extension.
>
> In addition, it tests some edge conditions on data that show flaws
> in the way we were performing integer<->fp conversion; particularly
> with respect to scaled conversion.
>
> Changes since v1:
>   * Rebased vs master instead of tgt-arm-sve-9.
>   * Alex did some additional digging through the ARM xhtml
>     and came up with some additional missing instructions.
>   * Everything cc'd to qemu-stable.

I'm going to take patches 1..4 into target-arm.next, just to
reduce the size of this a bit. Patch 5 is the FMOV one which
is missing some decode. Otherwise I've reviewed all the ones
which still needed review. Don't forget to fix the patch 12
patchew warning:
ERROR: space required before the open parenthesis '('
#41: FILE: target/arm/translate-a64.c:4683:
+    switch(type) {

thanks
-- PMM

Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp958355wrp;
        Thu, 14 Feb 2019 05:09:27 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ3NEmTgIdYWhnsSv+fb5IUBl7hzsrIYoXARp9rAifiyVTtl+O/PnwdfPpNIz5svBC+pu8E
X-Received: by 2002:a25:3b8c:: with SMTP id i134mr2916470yba.99.1550149767789;
        Thu, 14 Feb 2019 05:09:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149767; cv=none;
        d=google.com; s=arc-20160816;
        b=gezso73156qZxtmk5iD70txzuiYkJtoC1QDcUNHWieXf/mkLYioxeKr51y02L+kePb
         VmJ43/a0az+nKvMAQrL146igrCmZ/5o/p4L6vbA6xxJlMtM94kZts71Rz4tJDChAAa2E
         Zib/N+ae2qlte15Kpb2X77/KAK2v/ktzTlh6HfS1U2Ev7sX1uhU9Yu/KAR2IXIw0sjKJ
         5dDeGAVRTp34d7DCbJPTuPOSTfoJ4rzPUvwkCWzm48afLHopUMfzjnFoqT851mAJGW+9
         qAvd7jOYc5qp4ymNdwveN51bBUT2+krqdXznLTf+fRIoW27DUV57erxwr0aHKR6Tix7w
         8Y9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOsaPU8rWVQzj1nQ4d73d/8z75nGeSuGrNL5WexUz18=;
        b=lR0V8BTfRUwAdf1wh+LKG9qyKH8PpvllM/IkwfZnQGf+l5fFrHc2PRwtaPvWuUUd5A
         ur4jEU/qpgxx7XD9VqtItbT2Im/qclkLLUJYQSdIMmFZm6Gip/H1LgA0un/98aQsIWs0
         zKUCpGIMFtmltBk7vLcFyIfKal7pbDIaLNNqE43K37jj0xbQF23aP0SsfHwsg1Z1T58u
         I8x4HYBgciNhB+6LwdaScbXgg5MYnPNAb4fLl49VrRgmxnNvHy21pO/Q+mj9X1d5TFRf
         K4xHqK01FfgNJYmBCXgWzMVOeJ4C2oioGx476VQSFTj1IoRFYU8b/2sVoNKT16zQ1DLj
         YFtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eiLB/PwI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si1307697yww.271.2019.02.14.05.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:09:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eiLB/PwI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGlb-0000Hw-6n
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGhB-0005Jl-RP
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:04:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGgs-0004ao-NS
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:04:42 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGgs-0004U8-EB
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:04:34 -0500
Received: by mail-ot1-x344.google.com with SMTP id s5so10316650oth.7
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 05:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YOsaPU8rWVQzj1nQ4d73d/8z75nGeSuGrNL5WexUz18=;
	b=eiLB/PwIYbIFOZcYPI/8Z9+AyY9bM33XwYsnGEb5l/ZJr+1wPPKXz2k6vfuSan7tIE
	8IsBy5IbBAiB10O5sx1bA4Fmwk5+I7lkskVW6F1TzuJOFPm9ICXLGWkRNrEhGp+lrs9m
	Civse6zCF1xoNtCCvjIVg1MofaKXfqr7W5zb7cnMeNnWxN+nQ6bMe4qtYcFsw9yL6jpg
	V+KUDpVUcbtbId42xPKlQXKqfEWqN0Ykn+KUcakeQNx4PlOQBi2PPDx6ehkWofRWZIiH
	yVuiquLkdiK13vln6GpVn88tJbvh6vTxiBw4Wt0nLuXq84YonVEZSrj1XHy06JqoDN+s
	ECDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YOsaPU8rWVQzj1nQ4d73d/8z75nGeSuGrNL5WexUz18=;
	b=ZSmLhsk0CQdtS0/woyFLAu5q9nPKcbQaECEqcVI/ejZNw3KWPBPbNy23MK98DtVCAN
	t78g2XRUZW9KH2THYX0tYVq1YD1WXlUWlH45G2VI/WpysuDULCwUSVFLAJP7ai+dovYo
	nyqaZh/GDYE8ytvyvbwmnr8XcayF2pgL146IyTlzI8/hPlqE5YiEb5s3AaVaq2Dz+ec8
	HKSfjkoZjUS9KxZi4FcRPH6D56defeFQdF2qLvB4bqVl4b5wt1cotAs1AlEeLaUKtsXY
	DhGVzlqrhz7CbEpgsKFdeOJT/ZmL6EqlFq1AsU4u9gZwbN47/mJAU3hLV+3TMpQfm7f5
	Z98A==
X-Gm-Message-State: AHQUAubmpmMfAKL72nQnArGqywPrJHSX4MOzw2gQlyjW9mRW5EbXEV1A
	/sUZWfdnCdCNifWRIzLQBOrCaapUYhJYAJn86BJbFQ==
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr2049563otk.363.1550149463907; 
	Thu, 14 Feb 2019 05:04:23 -0800 (PST)
MIME-Version: 1.0
References: <1548985244-24523-1-git-send-email-catherine.hecx@gmail.com>
	<eeb0f275-b262-25db-337a-b6c78b29c124@linaro.org>
	<CAFEAcA9u_FYk40QyC=_R-VMVN74A5kTWYKCSgH-Kzya1_Pqzdw@mail.gmail.com>
	<4a7de0ef-8c33-6a14-f937-ab657559daca@linaro.org>
In-Reply-To: <4a7de0ef-8c33-6a14-f937-ab657559daca@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 13:04:12 +0000
Message-ID: <CAFEAcA9kzazJMyiFtMHCdmGPuUxWsmitO9DpXgRgG4-pVrMmLw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [RFC PATCH] target/arm: Fix int128_make128 lo,
 hi order in paired_cmpxchg64_be
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Catherine Ho <catherine.hecx@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VPdMLKPYPzIw

On Mon, 11 Feb 2019 at 16:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/11/19 8:19 AM, Peter Maydell wrote:
> > Thanks. Richard: is this effectively a bugfix for big-endian guest code ?
>
> Yes.

Thanks, applied to target-arm.next; I've added a line to the commit
message to note that it only affects BE guests.

-- PMM

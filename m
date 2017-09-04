Received: by 10.223.172.38 with SMTP id v35csp21730wrc;
        Mon, 4 Sep 2017 04:11:01 -0700 (PDT)
X-Received: by 10.55.131.129 with SMTP id f123mr247055qkd.344.1504523461605;
        Mon, 04 Sep 2017 04:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504523461; cv=none;
        d=google.com; s=arc-20160816;
        b=lTrCRIT963uJ0r4oCjzOt56N5T53Xl+L836yV3TdTiwbJQO7UvdmR6TrJ+kiT7tpJH
         VwSWb6T5e5jMzhP6fTXk8gyascoJXPYgYoZRsjqijef+diPduoHER8oCpUEDGiT2q58C
         LciKS/D5TaA6gqYhM+KAExEKPe29knkpAk9KWrMIZlDPY1EeFVaiPcyuwOAxFf8F83D0
         Yj0zKtOyJ0R9o1fBSXYza/9E5uv4KN3Hj91URhALVDfpzqlHFkVNzgleQE+Au/mVAFIS
         fORmBOOYaqAkVgFHanr+8UkUZuLRnu+MjQwUgfSoYKPmFPCdABJ0vBZQGJH7xFjn9MaN
         ggTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=keP/TfWPE4aXN6OrEv5cecBmdUWR0cCCkHFOwEOgeao=;
        b=G+srwcVg0nohhM2R0G2xxW3jKAZDJfCQbzPxnkseQWul3Lg8sl7idT6o1o+CRpBheg
         hzLbUEIHqjZqQ7VWVzQtQLEbnvLxp5hq1S7GsVDIsyDQxGNI/bOmDe1dSzPxHY8u0JWO
         Mwx5o6Lo7BaudJe1RelaPtd06P+FoRpt7c4pvcpdivTVOFdcmx6h8ARWRVIKrP37T53C
         EOopSxe19IMQ96vdsLH+KA63ufWDnGLvo07C06FP++0v3RHqG5gp424uSG7g55b/2cWy
         sdJoInGicJLPPk2he3caiWpOP7jQasgnvdcj/QpdyS7zq6xatgVR6g7OsKS1qY7Yed4v
         P/uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TbrwX8dw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o94si5701855qkh.537.2017.09.04.04.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Sep 2017 04:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TbrwX8dw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dopHP-000860-3o
	for alex.bennee@linaro.org; Mon, 04 Sep 2017 07:10:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dopHD-00082G-3g
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 07:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dopH8-0005v7-LD
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 07:10:47 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:37674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dopH8-0005tc-Bq
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 07:10:42 -0400
Received: by mail-wm0-x22b.google.com with SMTP id u26so1365027wma.0
	for <qemu-arm@nongnu.org>; Mon, 04 Sep 2017 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=keP/TfWPE4aXN6OrEv5cecBmdUWR0cCCkHFOwEOgeao=;
	b=TbrwX8dwILK6E64lfIHcayo0BwU2jhpKgK98+jyAKOl6GXge8gD+dfOREE/Y1+VWGA
	3diYkkZcX6zjOOJ0hjSlzCcpClGIOGy0SFAJcNKLWq1B1PIoi6gHIwUTp8Dll8KP7ly/
	mcEeRCsYWLuWsBBFCnQuVrYGcF1sYJl0bxUFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=keP/TfWPE4aXN6OrEv5cecBmdUWR0cCCkHFOwEOgeao=;
	b=K8vpDKe46V0Zdf8pwrM3OvvK117th48Bj99bCEB/x4Q7R1rb44wJ4XDP6StaRUNOeO
	0btAOHw8LIxEpN4ocVsXBYjSZJLNYaSrPE2AOYT3XxPe0Pk2NEil5/aITiRNdJAXiKdz
	h5g6atIuSq+4ortdGrOCUNUF3ytUKSnBnhPdX0q2jsn6RYHAbgimLXaUG3yjKsto7zBc
	rLOfEC8eNhL+7aQmy8rxm3ETWkSYuI7Dol2Bfn5qHBIDwF5Q3ZNAismoXGq+8WNnigRI
	J2o+UckKPc2u1K0QUOQHjlYB9gbu9ViOfeESlJ/sQDiGWZSSBw7BA2xHyJObGXqj8cFJ
	k/oQ==
X-Gm-Message-State: AHPjjUitrwf66GbTakRI1MrmpDh+fXRVYlSERub+q7y1/2WurlqDX1SV
	sr2Sawr8bI3Z43W1o0NMgIRxbzz34c+1
X-Google-Smtp-Source: ADKCNb60zi1TygaxN57BgorQFLscRU6ntBOKC/ac63UrWI2cGu/P7HkdGiByM4aet+HehfNOv2faH1eLPHTlPQMt4n8=
X-Received: by 10.28.146.66 with SMTP id u63mr27624wmd.95.1504523441238; Mon,
	04 Sep 2017 04:10:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Mon, 4 Sep 2017 04:10:20 -0700 (PDT)
In-Reply-To: <CAJhHMCDgm8RRO42PXDOEYE8oZf5OLSBZo+akM1Kx8bOJLTSYCA@mail.gmail.com>
References: <20170829173226.7625-1-bobby.prani@gmail.com>
	<CAJhHMCDgm8RRO42PXDOEYE8oZf5OLSBZo+akM1Kx8bOJLTSYCA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2017 12:10:20 +0100
Message-ID: <CAFEAcA822caMzc16XErE4-LO_sqLuiPBV+bR67sM+1_f9jx7fg@mail.gmail.com>
To: Pranith Kumar <bobby.prani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH] arm_gicv3_kvm: Fix compile warning
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A9SQnD0j72/w

On 31 August 2017 at 17:56, Pranith Kumar <bobby.prani@gmail.com> wrote:
> CC'ing stable for 2.10.

Thanks; applied to target-arm.next (with a tweaked commit message).

-- PMM

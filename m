Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF5606A31E
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Nov 2026 21:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dP7If5/E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWKef-0007Ky-2K; Wed, 25 Nov 2026 16:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWKed-0007K3-9Q
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 16:35:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWKeb-0004J2-7t
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 16:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795642547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CenIeRKnp5i/E92FDXSDR7xDv/MMC9GDo8aRmN7foQA=;
 b=dP7If5/E1rvh4zIAu+UTqD2HcBz9goNcbRPF+Y8gxHqqOJQDl0niRtSRaHgxiKj0KRChB7
 gORnzmZ5lDfFCuukYQBG7Wgy0NMeFPWd1vzfE/xSsmjvvCUCGpi1Y94svvAFunxi7wZChq
 DSVtQTC54lsPCQs9Lna/MYvrGQ//1WU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-qryJWob3PCGOhk7fzsbWPA-1; Wed, 25 Nov 2026 21:35:45 +0000
X-MC-Unique: qryJWob3PCGOhk7fzsbWPA-1
X-Mimecast-MFC-AGG-ID: qryJWob3PCGOhk7fzsbWPA_1795642545
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-55daa76673aso31062311cf.3
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 13:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795642545; x=1796247345;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CenIeRKnp5i/E92FDXSDR7xDv/MMC9GDo8aRmN7foQA=;
 b=leTzfxrxWDMgpP2nAS8uX8yue9/OnVCFAZhg6Uy+kEQhrfMrcxsLKTXZOjX8Hzt2k2
 cLnO3hSA/PLV8+veTjKzBE3Zb486ByqDuU+Tuj3v6SYRYfo8ETU7QhI/tOZKkOHfqeuV
 pPs4q3I+2coormR8m8RltVzDEmj1jwhES/c1dF3eU/OtgcVetJXmN8PpXwwS05weVk8Q
 KS4rpEv6X9bVdiMdzPr8dmq/QqbNd5iMndSwKNfaOva938jQRI8Y2vi/dfRQx73sM06+
 uWdPZObtrupIYXJ+HY7cUbvOsOnEURf7ULAPz83U4qsezURf2OsJrweoyf6AF8lDBINK
 iIWg==
X-Forwarded-Encrypted: i=1;
 AL+hErHq+RFRpZBEXVmTQJlBBuXKvHOTndPFGCFHeZukqqwbGByfADiu5sn6d5rKI+cPRa7xgKXm4OWkrQ==@nongnu.org
X-Gm-Message-State: APuU4Z8eTJuePZA3c7Zd20V24seY3Wque8nDIFdToH6jCPnOsfj/KJQT
 3PsokSJDUMcNKrxi+9AO/xN07tCyy4MpAWTT+7aWX241lHE5CgLI/uEj7XxNsRSe6/7viPJVw/V
 ram3ykoTxuNfcStq6BgFD7cTe8BDfVQVXDC5p6R5aQKMBWol2JBSkDg==
X-Gm-Gg: AZFdTZfmpGGyc/8vJvzia9qao9PMgT3iLPKOZBK8PvbcWt/ROZSGKBlyQQ7qDfEZ9Cc
 jiKOdS5Hd8fJtHi66v2SAs/rdsrPLrl6j9J82WcN4UAHi+xoAl8Rxk6BrlR+banmhyy3Qs1AoVH
 39KDi3aWUSY/NZBDoDaPtA0P6Yp4ovPeycLQXToqsM9ipWu835p2ggkuvhLP2LdQSEAajPzUaIf
 yzq+Z+JKLu/0MyyBqQhVcLLdVItPuhPWiHAh0YAPN7WJ4cahaCSd/AM//A2CRbdclVDvFAxgXxV
 gIcM9xEPOVERvhTXHTvCl/UC3CD3pd1GiM/+EmWRWeEHFKTRJCmSzNtlQA0/UO6Wjykx+nxquIi
 w3xa3+l7MwaO/XYYCQi0PCc+XXjO88olcFNoM7/rUPza0
X-Received: by 2002:a05:622a:4d8f:b0:534:20b8:5d1b with SMTP id
 d75a77b69052e-55d76a209abmr333062451cf.38.1795642544716; 
 Wed, 25 Nov 2026 13:35:44 -0800 (PST)
X-Received: by 2002:a05:622a:4d8f:b0:534:20b8:5d1b with SMTP id
 d75a77b69052e-55d76a209abmr333061951cf.38.1795642544197; 
 Wed, 25 Nov 2026 13:35:44 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-921349d0e35sm172042706d6.20.2026.11.25.13.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 13:35:43 -0800 (PST)
Date: Wed, 25 Nov 2026 16:35:42 -0500
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-12.0 4/6] arm/machine: Move all VMSTATE_VALIDATE()
 usages into post_load
Message-ID: <awdUrv2aKcfsPKVb@zhexu-thinkpadt14gen5.rmtcaon.csb>
References: <20261120124923.1656220-1-peterx@redhat.com>
 <20261120124923.1656220-5-peterx@redhat.com>
 <CAFEAcA_KaLtY21hnfAJimgdNFRiRBOLupsbshHpvXG7URgcKrQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_KaLtY21hnfAJimgdNFRiRBOLupsbshHpvXG7URgcKrQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8mTP3kPaDUI91Dn3BKH6jwJtqZP8dkG7ywGHSPwL0nw_1795642545
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:20:00PM +0000, Peter Maydell wrote:
> On Fri, 20 Nov 2026 at 12:49, Peter Xu <peterx@redhat.com> wrote:
> >
> > To pave way removing VMSTATE_VALIDATE(), move all four such uses into a
> > post_load hook instead.
> >
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: qemu-arm@nongnu.org
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  target/arm/machine.c | 45 +++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> 
> I think I'd put all of these validity checks into the top level
> cpu_post_load hook, rather than spreading them out across the
> vmstate structs (and expand out the _validate functions rather
> than retaining them). That also lets you drop the comment about
> there being an ordering constraint between subsections.

Will do. I'll add one pre-requisite patch to convert arm's cpu_post_load()
to use errp version first.

-- 
Peter Xu



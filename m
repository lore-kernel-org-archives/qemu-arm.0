Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD525D6101A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 14:50:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlTLY-0005ay-L5; Thu, 29 Jan 2026 09:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTLW-00053x-29
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:50:10 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTLU-0006sY-HE
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:50:09 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-78fdb90b670so9828387b3.2
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 06:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769698207; cv=none;
 d=google.com; s=arc-20240605;
 b=JqPFUoR1etg6oTb6U3KKcLYPUE8loBTSSt7vo7nsRmIg4ttwvoIPySnxF2qboBD9Cm
 52gww27Xf7F4fgu6Dtdrqo2ARwFNdZnWgzVkxfU0hKYp/nZrlSy8HFuITOHWgSHz6+AV
 lqo9JaLK6gsOsR54ADqOVrNJ5UA17o4+w9NEzhMNXv59joZtnkI7kFyVldMEhG+ZGJ0Z
 GcoMp3rMgkyxRSeJ74cpvQQafXTANB9z1V0oz76rTHM85QeeDkCaf18hmyOTAtkdB9a4
 1O35F6GZfLw+1ROAnXUUvmKDTMcf/W2G0Kr17h2a4WWiHzfMeveXDf6gEwoKnCXeq54b
 lDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=G102y0G+FgpeT9KmYnieigLXgmRkgBeE42iRMbIJv4E=;
 fh=hyubAE5DeRHh800cuV6DXB+pMPAuAmhN4XAVUsS1ZJA=;
 b=OVxjom/+g5uzVpQD7V+xkjZqOAH4jMnLnIaAG2QnLyAQuuEwlaOukOU7dunURegcmQ
 d+esekSSOCX0QEBOtRGWbnwjWKGTCk96epNddQEZilxZyzucQkgH0w7CmrMgEDkX8teg
 JjAr6iI9g1YN26mPexOyuhiwuLnyHEPM8jIfpfvJG4At/3QTKxqn57lqbMT/wSbivGbt
 YqF00FsE9fxFWMF9cLfGx8Ha3XNnrLFbIR4bGPnvYRNGSCgihdf4hz98rTrFpTrhbMKX
 1mrGTo9ENv0+XTv4NRDCYeUPu4O7nifNq2CSMFqO1pW0rwwLBBUNb/r2dLd16jQsk1iX
 OsTA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769698207; x=1770303007; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G102y0G+FgpeT9KmYnieigLXgmRkgBeE42iRMbIJv4E=;
 b=i4R2T7LaNkuojVBnl+LJLnV0zuD1r5n4omxLCex6GEHWChk3z5FlNnWJqtAydOde3G
 qC/OrOqCOIO4EkvjxJNjZiDhr+yynNP+UIIA7NQpNNl9HGfV9ADLttDNZ/LyN3ZZCYx+
 coEsGVDvnS2gh2SVk0l16ybmna/SQz23IMUyIUXltSlXSkTBNCXeVqJsp8iQHcStbtZe
 vkhdaRu3obTPbGxvRjci966EowehcMn6pSha+oYep1r4XvRp9fpiPyVe0N1om/TJzIa+
 MDx/wiZb7lSHf2A7BUqrDT75toWWD23/slyGskPnWCu+3opG4XAmBQzYCWRkvxgr632r
 2XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769698207; x=1770303007;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G102y0G+FgpeT9KmYnieigLXgmRkgBeE42iRMbIJv4E=;
 b=tOPzr90Tnn6M/EjSOMb/QnxD9qAu27M+2DODHvpIP8wInFt/bgRmYnv8pO97gtXlO1
 OFgbb75qvscVBPG+ZeF6sWpRVNlhwBRhkq9kjOxQAOAEkyvk0IYVnQyWywaObU1p3cK/
 U5GZLiliSr68FjNIC4Qp6h4a5eH+MyOxmCNqKF6pzJlxBtxg6DpasaPOM7rZP9BVEuKS
 0USPMxsc8wMSCamdzHq95MubHt/xvNUKygXmhiTQPVcLzBzzwuUBOoray1Ztjog0z2IJ
 zRbiKXwuq3cxrByXgOlvg0fYw3JaVnGwcPt/f9TNR1k9+kmyjNBI5zmzv6743rtY3s3Z
 5Pmw==
X-Gm-Message-State: AOJu0YwDKc+birK6Cv8o5j/yMZka5IGvio7YVH5IKkmnmEm+HEAgAlB9
 0xKdnYgEcHM/DYwmEzx4Pr1x72wpWszAt4tcUlT4mSNfrdmy33bd8N9piP9TeCtAFTT308JKCtP
 lyBEzdJqZT+z6WzhNfgl2UYAJ8kGDwcGox79wNe/CDQ==
X-Gm-Gg: AZuq6aJxJuDpVofYzUjO76td9wxSIHqUjb/pZQGSRr4phhHRNn0yBRt7wTItz/szBfb
 E4KE6/5F5XJZ3Mk1JqySd+Eh1z4yv0wfbQUb8cuTFRyibHqm3sPtytxHvDekd3Slb+QoQsaqGII
 vO9c380wmPBQjwKBNT6a4t4JsXIrVonP0QbMo3pcBfU+NhyMBZiQLmN7lbFZVX/RDhEIRjeGX3X
 SMIbrBjDSb5CjviTXKkAsfNOHTrvpULFTOywO4eJt6UNq3WIZU7MO5teJMK1WHRO6vRZg==
X-Received: by 2002:a05:690c:e3c2:b0:794:3392:5d64 with SMTP id
 00721157ae682-7947ac18bdfmr80511487b3.44.1769698206639; Thu, 29 Jan 2026
 06:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20260105154119.59853-1-cohuck@redhat.com>
 <87tsw4sycv.fsf@redhat.com>
In-Reply-To: <87tsw4sycv.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 14:49:55 +0000
X-Gm-Features: AZwV_Qi7pH38OgAtongL_NVnLFm9xKs1dgjxGD34LPqz96eNK2scExh4GhFw5Wo
Message-ID: <CAFEAcA-rFx10-iaNmsbsW-HoWKLPJx0QQVgD36_aS5jfX6hGrg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm: move DCZID_EL0 to idregs array
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 29 Jan 2026 at 06:54, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Mon, Jan 05 2026, Cornelia Huck <cohuck@redhat.com> wrote:
>
> > This is part of the ongoing effort to move all id registers to the idregs
> > array (so that we can work with an autogenerated list of registers.)
> >
> > Changes v2->v3:
> > - separate patch for adding the helpers
> > - put some rationale into the patch description
> >
> > Cornelia Huck (2):
> >   arm: add {get,set}_dczid_bs helpers
> >   arm: add DCZID_EL0 to idregs array



Applied to target-arm.next, thanks.

-- PMM


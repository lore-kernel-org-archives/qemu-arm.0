Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2296425ejx;
        Mon, 21 Nov 2022 03:44:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf495LFwfyPuwm/T1PruhMP5ort2wHY9MkGH7GYsW9HiaQqFAvV3yWpFH014dVENaZdrt6J+
X-Received: by 2002:a0c:ee64:0:b0:4bb:71ce:d936 with SMTP id n4-20020a0cee64000000b004bb71ced936mr5413671qvs.119.1669031059410;
        Mon, 21 Nov 2022 03:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669031059; cv=none;
        d=google.com; s=arc-20160816;
        b=cuSXaFW/2PTt15BAxe4TSTApo7DVCJChCjYduk3IuqgStX1L2Mqk39fSmKZ+GJtdEJ
         Gsob/PJ0VDZuOkca+gfAAZg2rLxSmrCZL13AbPGP30sp+fqh60LkWBifg/DJj69abu2X
         3OD8oIKgl04ho0PYGNTN2hvmahBLXpEMIkuOWEsUod8wkgJp9qI4JBgBFMxU59RYgBRz
         scDRXEqRKmmHrwrjK91lJIPqlSfnRnQcxUpH9EVODCfOLK+zHYKZRu/WgdeoGMoHNcH0
         HMxVSNGVH0k+OoK2+bl+mdCQqzp2XG/T1Bs8eLf98ot7aqEg9Bbw1obqk2Uu0ORbiopN
         F5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NY/lL/yH/+e1+JpDr08mqDOjkKsRi3ez0eLWMKgkMTg=;
        b=XotqPBo5eCuWUqDNRI5OZU8wBeAwFjQTxoIwpGKX7qrWsQP+kuFZLgKNoFj7TW6Ilk
         Pd1fbth61YZlZNXpZvOdg9N7b75DyjyJFJE8dsIgxXvCl4svBADvQu/DY1HNtoOQQH5F
         lDGGsCkPi39KADXz7a21QLyBpFG3qMQLF9CJSzgCJ+NB0lpphFHyG7Cmy6LsKR/ukVWr
         z2zUqsIzIjzUxFHif/opPCAAm6CthIx8/KwBQOMUdHND5atsE8NIkhkCcRQbdT80cq+c
         myEPWCtLs5+nzaI+BC+NGMzpuZDHiTsTPPd8QPj9kaX6We2rNCAPN+OPcLHedXT/+fuw
         fg5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MrnUmH8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a284500b006fa386918e2si6480271qkp.422.2022.11.21.03.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Nov 2022 03:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MrnUmH8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ox5D7-0001Xe-Lx; Mon, 21 Nov 2022 06:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox5D6-0001X2-3g
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 06:43:36 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox5D3-0006yd-GX
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 06:43:35 -0500
Received: by mail-pg1-x531.google.com with SMTP id f3so10937480pgc.2
 for <qemu-arm@nongnu.org>; Mon, 21 Nov 2022 03:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NY/lL/yH/+e1+JpDr08mqDOjkKsRi3ez0eLWMKgkMTg=;
 b=MrnUmH8tWAVqGkNNwE8pgiDkXpVrFoEFCgpxBiwMAxpcIzukQn+BuDOH89C9BR1YQs
 wpYPmd3AgO8vYxTt7cR+hFOuwhL8xBDxy2ZhrspHuGbZrFVJjSuSJ3CCVT63sekFimz0
 /1ZmTTszMOCb/wkX/nb/M6S1bDQIHGd2MWMzvCNBeM0qL960MKn2ZnzuCHvDKg4RO5Tn
 jfVEDA6ZZj2CxQ3bpQmDEPl/FxgWsNhNZRJpqvlJPtKElXZaIH3Fk33xFFtIuBeHNOSr
 zkUc1LTFAUfziOXdjfQ2WXh+Os6i4ct5crZnv6fAXW9blivwhq+GAMbu3xhm7r6HuO3n
 FkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NY/lL/yH/+e1+JpDr08mqDOjkKsRi3ez0eLWMKgkMTg=;
 b=EyA1BpyZesJ3bznKUa6ctA0cKWEHUGJ+Dd3APBOGXoO57E7jwJvdrPBv5HFeo9TpoL
 CABSWOHnWmbdcMUd7RJwYI55L4+uBek/6XUfV9nFrmNG8KMRm7LBNI1QZbzees68xZ+T
 PoWTpdiy8KvhIkn6XoDDZ7Z2HcLhmbQDuVMzb46Md6QL8aWOdpuuHQsV3dhqI/Czm4o1
 nvo+Xp6eRnbNfnSEy547zpQBLo6LCRZRzJOda6e756EdED9IiTAgyV8mULaCY1ayq0/A
 Xk/Bh7zkIjUGB4erBud2y744Y4EU9o0EL38RTJFlosaiW4eHyMBrFRSavkTTxwyCgoag
 eIeA==
X-Gm-Message-State: ANoB5pkCxOiwgSKccAursKUqgsCK8B+K1XoINN/uiF4xKmQD2ggFq/QC
 DWhgnWxSTDiJEodJeoMnKqfm1N7LXLn0riNvPY3BYw==
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr1156554pgr.192.1669031011691; Mon, 21
 Nov 2022 03:43:31 -0800 (PST)
MIME-Version: 1.0
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
 <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
 <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
 <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
In-Reply-To: <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 11:43:20 +0000
Message-ID: <CAFEAcA8BpE2N_91J1HXRvC0CqWLwpMhgU6prh6aO3PLO1C4Lww@mail.gmail.com>
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Mihai Carabas <mihai.carabas@oracle.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JCtLRwfu/jqx

On Mon, 21 Nov 2022 at 11:24, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> La 21.11.2022 13:02, Peter Maydell a scris:
> > On Sun, 20 Nov 2022 at 17:53, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >> La 18.11.2022 21:11, Peter Maydell a scris:
> >>> On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >>>> Use the base_memmap to build the SMBIOS 19 table which provides the address
> >>>> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
> >>>>
> >>>> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
> >>>> ("SMBIOS: Build aggregate smbios tables and entry point").
> >>>>
> >>>> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
> >>>>
> >>>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> >>> Is this a bug fix, or a new feature? What are the consequences
> >>> of it being missing? Is this important enough to go into the 7.2
> >>> release? (My default position would be "no", given this has been
> >>> like this on the virt board for a very long time.)
> >>
> >> This is required by ARM SystemReady Virtual Environment [1]. As
> >> described in the Arm SystemReady Requirements Specification v2.0
> >>    [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0
> >> requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts
> >> checks for the presence of SMBIOS type 19 table and fails the test in
> >> this case.
> > OK, so it's a spec requirement. Are there any actual realworld
> > guests that don't work because we get this wrong ?
>
> We do not have a clear example. The thing we hit was the ARM SystemReady
> certification based on fwts.

Thanks for clarifying; in that case given we're quite far along
in the 7.2 release cycle I think we shouldn't try to get this
patch in to that release but instead put it in for 8.0.

thanks
-- PMM

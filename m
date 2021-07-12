Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp2891375lfg;
        Sun, 11 Jul 2021 22:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPc/r0/4uyzwEKbLbrCKiWo5vr5HekI22Uo5kPp1YNwpav8+AS2xafda7eFXcxj2zTUbtK
X-Received: by 2002:ad4:4bca:: with SMTP id l10mr1837751qvw.50.1626068120922;
        Sun, 11 Jul 2021 22:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626068120; cv=none;
        d=google.com; s=arc-20160816;
        b=R4IVhYpl9o1gtNDn61hOBRTJ22AmdeIftpsQNMtIBI7o05aNnKWfuYjwy5SNdXnOY/
         wRNlPE6X3fAL/Fo583vmnjsZacuXwsE7lBTHtqgX40lvgQpF26tIK4ZNPLQ4LAJDMkmd
         zZLqifM91ZLtfXEeqbXbgJgNPD7euTilH1b1kJ39P8rFgt7t3Fqus61dLyORMc2s7Ssj
         oO/cGR6+rLSDrAf9uSDg/+Td0AOEpxL5kjtWrwfxGQlyF1SxiiTFKJDUlUztCUveD+FR
         j3H4hmq9nbzj0qoYKYfgEgTUDOd6aWvsfVGrbsoAKgPEohWvzK6EP7UWD8n7Ju2P0T3I
         Y4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=4Kl/GmnYXAaK7DHjfYps1/T8DK0PbqCvKOvOap6/l3k=;
        b=DAGZZU0nydo2J621NJl2LLN5pl5ZTdySeNyIocObsaRPEsZu3pV6ceQZfsFRRT01N6
         7+nNdmo5YFs5nTGL09PuHIFz8QXp0qSfEs9LKw5U4Dql22ikIQ296gMbpY7JA2MEVrId
         zbgyBp2GIUIil5RvkSHneBGHwL6mmQKYgc+X0QULnU1HJPhDM55eUDrEly70XwjFwNkD
         VEUXE+Doz+KNuK5OZ+eEUcs1rZQOtPj7z08e4wjB0SHRu+Xs5lV2chXFzqqRiokOSoeu
         nh396xXp6srWacgGWAQqiK9lRX+cSVABdZLh7+3P9L3mHyIYHsH8DdIqUFHcagSKIm/l
         Obmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@yahoo.com header.s=s2048 header.b=B67bvjco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fedoraproject.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si13272394qkg.229.2021.07.11.22.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jul 2021 22:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yahoo.com header.s=s2048 header.b=B67bvjco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fedoraproject.org
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m2obA-0001ts-82
	for alex.bennee@linaro.org; Mon, 12 Jul 2021 01:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1m2oZl-0008Jq-91
 for qemu-arm@nongnu.org; Mon, 12 Jul 2021 01:33:53 -0400
Received: from sonic304-19.consmr.mail.sg3.yahoo.com ([106.10.242.209]:44282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1m2oZj-0000wb-2j
 for qemu-arm@nongnu.org; Mon, 12 Jul 2021 01:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626068024; bh=4Kl/GmnYXAaK7DHjfYps1/T8DK0PbqCvKOvOap6/l3k=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=B67bvjcol7IjxS8bl+4zn/+2fXh16hhdRpC5m19g/+dfDrEpg3dET96joWSZ1LlxhVfvH0HCSgo+qys2CWQ6mVCwXa3kz3W5fKV36H+nu36bAn7Z0nIFsBxs51suWzW/zeoQP+vnU1ITf7n7Mynrjkuyh8HuEUt0nN/XmADOmyOpX4Kd4QotUpZoPur5vPLkqTMhIyeW/qwz8BKI8DacwyrJag4ZnpV/nebVpEJMuFXHLhcUi772p+G3/J9Uu67+UMCw3qVH8Fd2Py3LUWmdk+F657m6Zqdey1nfQKFO3hi8dsoclGCuDwUDIOnGD/+1J4Nh8n8MKz/hxp7hCSCWvA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626068024; bh=SumwDziySBaOn2aK8xyDmR5bdUFr+HUvligtFGw7NcR=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=Ga6ynAESutxEK6DGe4/gP6n82Wsr7dk6L/JO48QJIZ8ZO1BSgeXPF1M2a6IQ2RHeRTcjOOY21SyzWdW//Go0h51n1ewOFZkXu87yRHvtmDbZgwIAOC4NPztQ7VHvFcWaprIn7Rww48pZUFkwNfOFpTql1P8enYpKZwZODwAvuy4eUryAeZGj9o7FaSv63x0Z4QzyXjF9v0GAg14guetmGIcCF3HPMwJp5TwIql8ZmHuoLTAAtK7gziQiKwa6PhLsDSyTaK4xjrNmKN9pQluh1uObazyAWAFPcKqr3hQhz9fsaSIuB8J0A/l0JVZjSRSfZGMaAofMDKC5ekZ3tWlZGQ==
X-YMail-OSG: KeHv63cVM1lz45BDuw3O9YCz5yd6eym2eehts7uftcRuJ5dEtQJj6YAq_Sw1UYf
 Xji5ZYHLEZxKYTG9t8RmeXtCIDA1JL6G1txfeAmyOKZq2xHaB_KIVk6kWMR6uN3TGaU5UG74Q0st
 S3bnhXowj9bez5og68qXtBWRHMnD6ixG6wxexrEAeIPmbu33P5ytmm5NxZrjUofNIcaJjq_NGz2L
 Gb4iE7wCuyG8fHorP3mhOsayJVz1Wdz0BhxQ0sU3BhOAbh7iH0L1uH9EGS_bgezrkqPfLDXXZnPx
 .ybOfSfdhUSyAHpGWvqwyXikiF_opzkPUZLEL6DnMc5epsrO6_5ICGk4hOgODZcOG7g2DHncukLh
 uA_Dr3P0JdO9epTMd_20KeYrVnGS4rR7IhGVsFq5FtZl7SlMLLJbRsygQLosf4o8pWn.YPe2fDIZ
 _VU9C16YtoxokCLtiYX3UIFtbZbBWGP1AcUOpaoKREb6cf8HKjxsyL8PNL_XcMxG5xw2ODvdTn7A
 8jacmEmQi4CRA5l0.veCsZBkadwBBcbh9yN2WmfIdZSiJbQ8bbr6FDK14RPZeHoFwxcAEUlPtVSf
 KZSPTbpgkVGWBVyq9d_uMdugoHDa8niHNBs6z2GGgk8L8VkuMVak6EIryuc8xsH7eWqc6re.BIMa
 oBocwWncbsXA8pZd5b3eXGJFuSVxuE1CrfL.AGF8Qpns6qv.0zyR14wqOoFXYt9827VnM09ib.EN
 pqJxySYbj7WM_MUPOa7ymu5mhS3RFcfQKbo_O5ndI6E6IWpgKhtXT5qZLuf2_JZh5uUUMi9dS9M8
 AbOyMOcv_ndLmPgIJjcZ4E_3BMjngz0K4CjEM5mBn0TTisTNOXMREhc3wEXxfQbNgkJ_YneaEcKH
 7zrt5cRRztCKclFpl3xOx6Q6e.kHoquhd5yAd5_x9QGUKbk8TLBUAmzQFPhu55E3_HibXqU5zaqK
 3vDPXszy0SW74.G6xxCTaXzFhAKoQC3Da5xC5LlvusheCIcqr4sc4KvnV8.9a4ENp3XZTRNO.Utz
 g6OkqM6w7RkRR4G927eeWYg5mdPlLj6kEYn1JNYMHerwMhYxzWfzi7t5ApDOp2DRf25DvLbIc5di
 jIOrzlYtvpg.l_Kyx2VG7j1YyUVq9GW9Z0zUe5VRIyngtMLbPhP2zSEGS32jF7VAV9zN1tPDoudv
 AhLEUZq5Dd3FPBKgTSPv8ph6AvPnopvGErCB6yLwbbLSye..TCzKozmnvg_6E_pDUyToESr3eW1k
 Rj05pDf67kGfwccwwi5AjAQQAXusDOSAqo3Xjy5oHcT9H.LbrY6FUKYEWL28b.NhM7sO5EBpISF1
 yq4mETw.kxQsoMJhsfpJ_wIntroHTHSZ97YUhrMml_H9H04JoF.QgE3loRh9o.nu.RFEaUrtLp3U
 fTvyFNs_TMpmKmhahz_i8zgW6NxP4mVvsMd_7niFUcORykjCuoTEsCCbrBG9oLFhJsc2U1PmWAyG
 LmcDTNC6kEpf8JaaBh4Ihk0ZhXjCXuWbkLLLUI.LNnGxvICLNODs1TUioucjXRtA4QTk1Av0cCOd
 ybxwum5zkTRyobipnvmonWNMjLJZThONeQP9i_f0Q85WUJMN0aTcAQCILx4tBVWkog3Jk36u63JF
 wzEOUqRzlkxNusFmqCLnKDMGhv5bgSUHj8IyNM_JJtLs8g6_PqVEw5hAPSRzFkjm_aGNTgzAsC_t
 Ps1Ls8pOEf2nxjLr12peXQPGgRzs2SktPf156l7Qo_JJDS._HPAS0sj6gGxN848Oiougk6ZhJQrX
 bVxDBBufCYEzzOlk60LOUHz7xDHNGAPfZyUAxN3eXCqUsfaFSy3hGp7ylu1gmp8PqC00gb6TTIYC
 yh8sXqTa6yLK95cb_ts0CKi3kHstq2HBYYmTxcrgomnBfOov3qu7QzqqhuYx81Cf.MywQbh4n6hq
 UEaTPpbH2JKjH08twTrbskJJXje99ZR19HDsK1NmaKm5Dq4ekx9zFUoGdugOHUlILI3qf10s8ENv
 1pEBnLqK6vSFf3OTa8h4B0NLk5GTijJ7H9O2WBII3mzKs6CBYvk782oDu.GLS1V6SmujDdpBq.Nj
 QbDi_4jzdufL8C.JeYyo5ELOuqLxzbbW8V7fl_mz5E9NIRYI9u4YW1PqWZ9RCyJeQCesTiZwjEKw
 pmoPV7g6j6qrn3ukGK9Iqdiyb0IneLKH1V2brtQ328XrGZSmfTj3TAJaPwIbC4ktTtlPWORVnPRv
 yQOgzIa9vVYtBLMGadmZ.GmOOHvgQm77zKSc71sOvM1ZFFlF.u8brE2WMG9cp.jvr_hQ740Dmv66
 wjcTa4Uz1uy68yn20qYd9qDmZvY0Wz.sg8LkrXJeCiXyHkL8Hplhzo1bkxUJVgMUIXzZ.blNU4Ar
 7qECkyzlPkQM4w3.8wVxHuyEYNBJIzZm3g4aj5MB1TGKOqG3_GQkxcmh57ferwlK9oq4TWtgVR7C
 1PLFW3z1hoOwDQMRJOiHs.zWM3J5fpT9lqPwdX3v_5_rDDEGaLAbm1GkiLDfUkqIF2SW6gECZUDH
 7Z.iIWFj5NbocX1OCuBe0plDkh6IkDQEPusfsyFPp64ScRkDkoeRRWuEq0rT4stSIZXQy4ozQ5z4
 O4NsR.enGM6ASl1Houusf_X9acvxyIZisOW1WogxQuBJdBll5JYG1bBYc0hurZFi7F.9ov7MAmGu
 lHyBxTKbYuK_7_m5NoMiLP7YpmgDCHY8C_rP1.AUHaiCLST0697NGF__nIPDoHZqaJcD2ed5B3XR
 eL3eOvjMf6f5pFWnV64d9DgiK7k8gudkz0nQoI6ktT2UMtiUCtYri5l0ch7IJzfXmJ9DGGmx3oyF
 cCEn9.487m43o4d9kHdJ7gHMT5Qbc_PE4aOELuAVD1CY5XhlJVQdC5PmgPLUi8e4wYSUzDctw3w-
 -
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.sg3.yahoo.com with HTTP; Mon, 12 Jul 2021 05:33:44 +0000
Date: Mon, 12 Jul 2021 05:33:40 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: Qiang Liu <cyruscyliu@gmail.com>, Alistair <alistair@alistair23.me>
Message-ID: <916126920.406872.1626068020282@mail.yahoo.com>
In-Reply-To: <b524c816-b1ed-458a-9fd7-f303afc9bf04@www.fastmail.com>
References: <CAAKa2jmatcBonTYeZCHnE4TR543FKQR4Lrv2iMKaZUprXH=3ng@mail.gmail.com>
 <1437061986.489095.1625809641822@mail.yahoo.com>
 <CAAKa2jksX=Sco3-ETvue8d4wpyoFBSzgOGua9Z8WyOfeY8jEFQ@mail.gmail.com>
 <b524c816-b1ed-458a-9fd7-f303afc9bf04@www.fastmail.com>
Subject: Re: [QEMU-SECURITY] Out-of-bounds read in xlnx_dp_read
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.18603 YMailNorrin
Received-SPF: neutral client-ip=106.10.242.209;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic304-19.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: P J P <pj.pandit@yahoo.co.in>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "yajin@vm-kernel.org" <yajin@vm-kernel.org>,
 Mathias Payer <mathias.payer@epfl.ch>,
 "qemu-security@nongnu.org" <qemu-security@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DzdPEJoaEWFM

Hello Qiang, Alistair

On Sun, Jul 11, 2021, at 6:17 PM, Qiang Liu wrote:
> On Fri, Jul 9, 2021 at 1:47 PM P J P <pjp@fedoraproject.org> wrote:
>>> * Is it reproducible with the KVM virtualization support?
>
> No, it is not. I got an aarch64 host yesterday and tested this
> machine. The answer is no.

* Okay. Thank you for the confirmation.

On Monday, 12 July, 2021, 08:21:49 am IST, Alistair <alistair@alistair23.me=
> wrote:
>As it doesn't effect KVM I don't think we need a CVE or to merge the patch=
 quietly,
>so it should be ok to just send to the list. Someone let me know if they t=
hink otherwise though.

* Right. Since it does not affect KVM virtualization use case, it is not tr=
eated as a security issue.
=C2=A0 No CVE requried.

* Nonetheless, we should fix it as a regular bug. It is okay to send the pr=
oposed patch
=C2=A0 to the qemu-devel list for further review.

Thank you.
---
=C2=A0 -P J P
http://feedmug.com

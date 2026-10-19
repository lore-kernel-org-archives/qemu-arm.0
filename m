Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55724CCF2E3
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 12:02:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIm4J-0007he-6W; Mon, 19 Oct 2026 08:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIm40-0007c3-AS
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 08:02:08 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIm3y-0003bh-Mz
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 08:01:59 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8acda240937so14979737b3.3
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 05:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792411315; cv=none;
 d=google.com; s=arc-20260327;
 b=Dss5N5hqi3Fjg5c2IY/tns7Qfa3V72kYfUqTwMzYXVQXnUG/sBO7K1sy+fEb4Lq+Cz
 lNWxPsv4WfKjRuzLXgzGyjDMBmdkjujJPMKQLvO5RBleARn+WlsP4rSdYeoMts8ArGO/
 EWNt/LNlklVk31gSMXscYYFuqwyxWF3P2WrDVSmGMvW9Km/33j7a5zJbNX2xrEmT17dR
 Nhfn05E4+lZLQ0SErcP1S2hKib/0Jsb7Tn31cqNQPrLD/7fbFrVsPNUqDnE7bIHWc6EG
 ff7+6J9Y6Tyq+YXXoxrmdp+NCak3DHI+072K1ury320I8tKtYsJbyOP8sYggx0UV7zqD
 XB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Z4VrNj0cpeJ6IXR8KDNWQlOCfGn5qVmCnNm/xiO8XQM=;
 fh=e/ZtJEnZmdtNdokOfp/VpeLJWZjlApSnav7eRggQv/c=;
 b=Gm6s6NG22Yr+qdHCM90qN1T67F/3b0XH+U1nf7lMFOOeWC25exENmbxN6eV9s2sgfu
 QmDthE+VHtPwkAzjXwJ4Uj/Ov461VC68cY29vZTVM4jPAlHywLiNSRVU4fs1tzu/gDmu
 H9XTR8pMYtrpcgemr9wFsdWD1VwJh7L56Qdmp9d+m21xX3lGoriq40uYHBZ/4WkdPO1W
 oUE6rejkiQ7o4D58ift7vbwvdyC1FJwE1ugoSQZd3cfaQIHG4udOu3vlZciGMFsQA3Wm
 pQJD0VHaifdHVOSIkXVdavReHuGJcXMy7aSU0KO2tneXfQI9nP5ckbIKvqyvEnB6QJ8t
 x2Pg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792411315; x=1793016115; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Z4VrNj0cpeJ6IXR8KDNWQlOCfGn5qVmCnNm/xiO8XQM=;
 b=x0MvUMkugnoGF7fTHmYXXoOUyAJGJHRn0fVCP8K7bC3qPm+SSmUV4Y+q51w2neis8d
 AAhpCSWGkR9P7+FS3mkNy8//ZiEaEqEpglnxVJ9QnGvXa2tSQoNFAwowGiDjsV7FPLVL
 tgRG/UenWykM06CL6SK+ZmqemQMTFRdJPYb6mFH2kU7+eVrhufLBzalJLeIwZOn0cCEG
 brXoUti8QkTfJ2mnSep956uNr/7WvbyPiALTBdKa0PE84BoDi0YP3uNjJMpCYpUcRDuM
 Xv10XWSygu6Wrw4YQpw/AGDxGfbD3Oyg4N1A0Qrg+hJF11cR+fJjqtSGqxSBPkYdhmKS
 Z+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792411315; x=1793016115;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Z4VrNj0cpeJ6IXR8KDNWQlOCfGn5qVmCnNm/xiO8XQM=;
 b=u9/JC2HVUVn/sJilvdJ6WoonuumFvJC0RIKm5FLdPSRzngCBm8oxLm3vnKlodUQk5Y
 r9g/eGfbVUbJBb2tAfCGa1b/hQ4ALV/FoTeI/d1dZOmslUw7uC5pzrg5DFPMi9BoyMbL
 2ljWsVysKPfcB95KGUe9mlZrhf1XLSW4hLmo7OwxME2Kj9UyYlX27IvAtH/mEEu0+K71
 xbp/f6MFGBI517O6QBZhcJKyuyMqub+i+LD8r6HY0A2PcpPkv4So+Lp+Mtgn2TpPCEMT
 KNbhEBzSUD2eZa3L1T+sI64NY3tnX4Uja8sQMkhUF++EYs8SZtWGn1RssYFFZ+bvmgO5
 yFcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwkLXXMy9J86CGC9TG6+yzwXzEKNmKRAOQX/U6OfnL5cp5DqHoBBZjkOObER2lZmapHoMfL/Fz8eQ==@nongnu.org
X-Gm-Message-State: AFq9FYJgEnhLibTD9F/ZXQZDT4l8tlk0WRDs8ukbOIzVRU+jeufteMaU
 qLY85zXpQr8oY8wc475MTNkgXQEhaRLxLsmf0ULcRCcZ91M49V1DNpl1duFf2qVoh2mIK5pELBl
 y0aZqK1tlGxwI1S6kS9f8+c8N+H7qpnqMbgBsbogugw==
X-Gm-Gg: AYBFou3pXSOOzMafqZ6bPySLm5+GN1g9l14f3zKk9vG8ecnXxxwsuhOCnJnbFnOeeIf
 FMN3t1vr28RJzp2vuubq9X9fW3j1LrGI2oggl9nhr/24bAmb1lwDoPMrFZ7YRhGHJKgvP++NlYZ
 CklssGDiSoayZnHXmD5VZ77dutwVEvhOHsTU/EK/Cxz+FSwGXxvg6xKDC5BAFE0eN4GYJVND/KJ
 M8omw64DO1ABk8dOFiUmDuiFFbJj4nHUufBjH3x1hQjov+gcIfSqk+aWQeNhHUlmLTbLmt/NUm2
 E+zyn+u9ybp3NagLDrvZzQjWilt9YdOa+vdW9mssX4GCojOSlHB/Bv+nOn8wDs9Od+yOctR0RbR
 KDKOZwE2Po5hX6Zlu9rPvSFTeeQ==
X-Received: by 2002:a05:690c:c509:b0:8b0:bf45:9622 with SMTP id
 00721157ae682-8b0f2177175mr22910667b3.30.1792411315323; Mon, 19 Oct 2026
 05:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_22E95650AA60C6E59860452C0D61A21F1105@qq.com>
 <CAFEAcA8MyrqWC7=A5Bw0G5G-2J64iTLmfY33dNDLm0jvmRb+Eg@mail.gmail.com>
 <27040691-e4b6-44f3-b588-cbbbee13cde2@huawei.com>
 <CAFEAcA_4xb3CBL9TTAdKMOG_ijWpt9wsveCp0R602VoFaWUH1Q@mail.gmail.com>
 <tencent_82895B2529E419B263EC95C8349389114407@qq.com>
In-Reply-To: <tencent_82895B2529E419B263EC95C8349389114407@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 13:01:44 +0100
X-Gm-Features: AclHuK8RS396TNxAHoYmhOi7iGPFgZj1Ym-YMspk-esSRUadSgshcrVPxpsXFv8
Message-ID: <CAFEAcA-amrQOM8+qnaxgWLyGNM=vp-vKV=OqqU7Qp17PRiH_KA@mail.gmail.com>
Subject: Re: [PATCH 00/37] Add Arm MPAM emulation
To: Jinjie Ruan <2118537295@qq.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, anisinha@redhat.com, armbru@redhat.com,
 eblake@redhat.com, imammedo@redhat.com, michael.roth@amd.com, mst@redhat.com, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 19 Oct 2026 at 12:46, Jinjie Ruan <2118537295@qq.com> wrote:
> One honest caveat

Please don't send LLM output to qemu-devel.

thanks
-- PMM


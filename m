Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp400389njb;
        Mon, 17 Feb 2025 17:14:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdhyvRnED4wGBrrJetHXpshq0jv6r3PQKAic/tEuu1b+W8s3+oD5dRJzx58i2Vz4dv7spmpeahmpMwGg==@linaro.org
X-Google-Smtp-Source: AGHT+IFOkQmSj9jiOMz9GY9wTt9P0ECu0C75808luWYPLyVYsnsVazHc5sHzmKddqGrTvkvf9CfL
X-Received: by 2002:a05:6214:29cb:b0:6e1:700e:488a with SMTP id 6a1803df08f44-6e66ccc476bmr154579186d6.22.1739841296157;
        Mon, 17 Feb 2025 17:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739841296; cv=none;
        d=google.com; s=arc-20240605;
        b=Va33TrK1CSaY2ZVs5nBL59QK11H5r289+4XgS8ZQav//j2ufaFAXhryglKWQ8sklaZ
         KeCl8s/PP3sdj65hHyInEnK7G0DoyKDmQ8JQIGLF+uncAVt91RZZLKxJomknis/xj7BM
         OhgQn3zwxMqqtbcE0iCh6Hd2TD9xmoPuL0Xy789bNT30eFfk2gQhni6rw8NwrZAim3l+
         ue4ma93+kKLodsBu4VHbnvi7VhvklU6TTKXsxSSikNS1LTUCfEnAakT3dhL/+u5IWS57
         7onZnf5Tm0hH/Gwu/rjXwsLDVwQC98iC30SSRtYibD3QzqY/VYUKEwc86XctsJF4tSgC
         q43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JlUytGWMnvbmK4f4oX+kdzLnB9J92mhbar11srDT/3U=;
        fh=6y4bqqcbsEu2YF1Rf7985gPix2EtN8l8ZRvWINMBUFQ=;
        b=cWkZPvz2xJZNRXtdkgOfnmmminZHzw/Ux2nf0JyFiaGesePORti0C4jOxsLsoR7Ild
         ka5DjW42KYJOndjJCY0fJvFSI2XNydnkQKyInM7IbcxqfAgXcP+9lBlHeDDoXhb0fLee
         RasVv867GuSXvUnnyqYPHoR9ThjciHNBnpJYv6Y3dT+PVrd+wACYZeRUPXu7cQ0PtTLP
         faf11IMsStfjFQ4AjPYdb+39TxgZoAyYnrTNcMUm8qDEPecyE0hB11f/n98PFiz7VBYj
         ks82896yUnfM5C03uyUMyZ8faA9GT7abGgdkep4sBDErJBT9GxzlZIh5DEcSyttDRwTP
         a2cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UmHBC/Qg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9a8e07si100889026d6.232.2025.02.17.17.14.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 17:14:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UmHBC/Qg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkCCC-0003mv-31; Mon, 17 Feb 2025 20:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1tkCCA-0003mX-Ri
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 20:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1tkCC9-00065u-Dr
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 20:14:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739841280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JlUytGWMnvbmK4f4oX+kdzLnB9J92mhbar11srDT/3U=;
 b=UmHBC/QgZBl4uiaZWJe2SeHjB7uIDStzzh9Fr+JOvoK9ZgtS3Ds7ICG2v570fEGpDS3yR9
 rawVVkV+qhOJnBeHayAx5DS/8pZvdXhQwCYOy4WhymJ2k7RjXlJAJp5lq51hRLUPEqoHnG
 sfhBmPQ8D+sPG6BF9GVFqJl5sZhVSqo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-k1ZPHJoCPged85qKTbP84Q-1; Mon, 17 Feb 2025 20:14:36 -0500
X-MC-Unique: k1ZPHJoCPged85qKTbP84Q-1
X-Mimecast-MFC-AGG-ID: k1ZPHJoCPged85qKTbP84Q_1739841275
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2fc518f0564so4269750a91.2
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 17:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739841275; x=1740446075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JlUytGWMnvbmK4f4oX+kdzLnB9J92mhbar11srDT/3U=;
 b=cN8uLRtqQ7oc1BAAWqSipAaZiKCAM3ifacO6uZg/6/ZoRdoFk9wb0mfHDPP7Qj2sgy
 ogZD+A8w/4T62o36HCDxW8Q5MpbmMC22yQs1ee01Wx827XXDtLT7U1+DC/UT26ruz8hS
 x0nsDhAurrE7DbsdZzZqoqWMzeJ6cLKSU6zvip8OhIC2+1GGWqXOSU9qCVdCVm2YfMh6
 8iaCQHa0bHduQpjhJuTHcOBwTjwlogMLNoVzTJ8MbOrGZxyq0/QD6g6ZKgAVWffTMUi0
 JKn8qHIqSYuaLm0BPar8ykXXht0Jn4sXCUr86cZtiy71v1x6IgUpdrgkR125+Z1rE3P8
 F1yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3EQ+5G0+FpEOdIulySu78Mvsqp/SqQ0d5GIoSqf50nk6f8AEdjSguc3Pyry5tvnMZzGPaLXTuZg==@nongnu.org
X-Gm-Message-State: AOJu0YweKp5cicQiI/AhGTXJLqSrLa8PecwVUgVjwl05LFk6fJF+lirc
 tndLjygXSJ1xrHlUMXwxRU/+ExLtTYWcXM9MWsBCpRVswLesHexP2MRWl5pBPT9GcWYk1kdhjdp
 BP1l1NnCgKGWyazB1vgWsrt+TPCJa14h/yH9aprpoYKEHdPluQBpPb1/pLHGN6BJLMz9xHVoC5t
 Cc7vw16YMFtOFIxDdw1D9OGik3
X-Gm-Gg: ASbGncvmF1NlKeI7UTWJeynGs5NfLPU5EKpQtODbegE12RqsM0Jx/DicZNzgSblh66B
 g4NOf1jSjcoYmXE2vN17f77TTO48wzowE1/9hX+ZEbbXRxgWSqWMICoXgSkAHGsk=
X-Received: by 2002:a17:90b:3c0e:b0:2ee:c2df:5d30 with SMTP id
 98e67ed59e1d1-2fc41049570mr15485551a91.26.1739841275259; 
 Mon, 17 Feb 2025 17:14:35 -0800 (PST)
X-Received: by 2002:a17:90b:3c0e:b0:2ee:c2df:5d30 with SMTP id
 98e67ed59e1d1-2fc41049570mr15485519a91.26.1739841274953; Mon, 17 Feb 2025
 17:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20250217133746.6801-1-eric.auger@redhat.com>
 <20250217133746.6801-3-eric.auger@redhat.com>
In-Reply-To: <20250217133746.6801-3-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 18 Feb 2025 09:14:23 +0800
X-Gm-Features: AWEUYZlemt7CdyCxs3gTTPsy35o4E62-eO8fjj4mFeDyR3v_ATbsmttI1QkZuZw
Message-ID: <CACGkMEst7Q5Zdu3AahgKaTnCh46b+-8f+wkFx0e3Apc+jSKRGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/i386/intel-iommu: Migrate to 3-phase reset
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, mst@redhat.com, imammedo@redhat.com, 
 peterx@redhat.com, alex.williamson@redhat.com, clg@redhat.com, 
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DVyJvLuAhijel8caEwE9gIQ99dH38yTeUuq64YsfDqM_1739841275
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KpVsYPTnA63c

On Mon, Feb 17, 2025 at 9:38=E2=80=AFPM Eric Auger <eric.auger@redhat.com> =
wrote:
>
> Currently the IOMMU may be reset before the devices
> it protects. For example this happens with virtio devices
> but also with VFIO devices. In this latter case this
> produces spurious translation faults on host.
>
> Let's use 3-phase reset mechanism and reset the IOMMU on
> exit phase after all DMA capable devices have been reset
> on 'enter' or 'hold' phase.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


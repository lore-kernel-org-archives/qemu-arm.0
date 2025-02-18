Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1004102njb;
        Tue, 18 Feb 2025 14:31:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEjTUaCiBdHmu4sMM+rsYvgoIWtlP3yq5jNMkbgdOjNiKY/ORYyEpgR0Vj4SyvBRmxJ7A20jhv8W/jmw==@linaro.org
X-Google-Smtp-Source: AGHT+IFGrhdU1HPeXFpaW+Tc6yJ+JX69PFpGrJQEt8q35vxMPStvODj296xOsd2ZM4WLDCNu1tcf
X-Received: by 2002:a05:622a:14ce:b0:471:c87a:7a27 with SMTP id d75a77b69052e-471dbd07bd0mr191740001cf.15.1739917900795;
        Tue, 18 Feb 2025 14:31:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739917900; cv=none;
        d=google.com; s=arc-20240605;
        b=cazw8G/g8dxZ1kCfY5am4tBrtu5Dj9ib+1mGYmKjKQvOIrfhu5WJsyui3JsGKfxSOd
         xvmpI95YaBV3Z6ci0Unz3NIMyGA8utn1JhPTE8VI+zSGHTUdo1/mYWModDZ3aQh6/jKM
         wp12jNk5o7+/WVnFw1Cv251PjLgfq8fV3iGpMJULP5B/M4cpv5PvYzNL8tQuJx85J/k0
         jV9oJqbILKpxmILOr4TGk90WoWAp34Gp+V0Tut30BjcCFje8H91hkwwAt5HqPs26j8EI
         uDZ1c8d9K4TKohqo8AeyHPRdXkadBPxpLTxLrBRgnfgsI/KMBIpfzhN0MlGeN5PCxiMp
         lNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ReuhTalE1kWgzBc4wxzrNTInH7tLQy39UokfOV7tNTg=;
        fh=TIA6GPXbKNqTEbPK1CngZjjY/htXjd5AUYBs6eJVgE8=;
        b=PbG1+xIvFF5lBKkLobDd+lckr/3RZVTvBC5dt/5p76Rwqc9nkDI37MpIDBl+Atcb5H
         oQdpyPa9M8k/Z3/e3FxnhVTBlCqcYGap1hJNUuEgTNnpDC2WIQie5V8eHDkK0ZbxQ31g
         KwQw3ktM5IJBQIgdh+/xVmWHo3YLxNzMBCizhiW0NBNy4R3Ptks5Chh08ZgmxUNWeBh6
         BK9xRXuu2cM3G9LDsfs8YgzFqLFLtPgFxsEvxG19pxl258bgQHTbwiFn+fJRn42xJR37
         s9w4DDlLt5EjY6TIx47BP8xhc/uucrG1HiFC08fLinQYSgt2sZD3zQJVGxcVartGkSaF
         M6bQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i3/vsFD4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471ecf99a3csi51700611cf.444.2025.02.18.14.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 14:31:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i3/vsFD4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkW7d-0005J1-Cd; Tue, 18 Feb 2025 17:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tkW7Z-0005If-FH
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 17:31:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tkW7X-0002nY-T2
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 17:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739917875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ReuhTalE1kWgzBc4wxzrNTInH7tLQy39UokfOV7tNTg=;
 b=i3/vsFD4jJ+csrLsOVFZANgNMhriWqNvW6zDgS4J1iyiasVoxbFb8ASMP1Kmwx2qavovuK
 kVRVGAUzfHmpqD6eCfAlDXRNY0ziZ5QHTkBIBlHY9pSn+geE5fR4tn58i5Y3cK3Ozu/sG8
 p045NhTgzcqKd3Z/2vwgCHN8i2LXubU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-gRb0ZEDyNcmXO3nM3n4gMw-1; Tue, 18 Feb 2025 17:31:10 -0500
X-MC-Unique: gRb0ZEDyNcmXO3nM3n4gMw-1
X-Mimecast-MFC-AGG-ID: gRb0ZEDyNcmXO3nM3n4gMw_1739917870
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47207b66f3eso11077341cf.3
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2025 14:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739917870; x=1740522670;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReuhTalE1kWgzBc4wxzrNTInH7tLQy39UokfOV7tNTg=;
 b=nC49R5PqnkXkynf0IyXpTeBKzilh/HbePwfPNOvaeKZqWxQ8RD+jKKdtJJC+MPAXVo
 5nGvk30phyff+tsJX9tNP7OnH1tAQr5cWN9OTa/FQRq6oyKPtDwGE2A5GzdniMdR+v59
 5HhZUMCO9QJHFSDWCkfMT6d4lbJlbKgKfV0eoVWZzlEYhx9fQwXpESFgh5UbFPteEr/b
 YFmLzkPu6bYSscLeQO+Qk8Liyvj6glVYyh9D1Nfl51Exeiw02PbToQ/g95yyXwlBVKIz
 7AnxVpAbU0uGB8CE+jfS8XGaWiwRSRv/zPZQpVHdMRb/VBldS3Hq7tRCdM0BJMLIt89P
 6lkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHGt7rSWamZhREA/WaaNOzLO/EIQqjKtR828xZpbO7W6KOB9WQ4gqI2//uaXxVZ8LEQt3VV5EHSA==@nongnu.org
X-Gm-Message-State: AOJu0YzNtZS9J35vegNkV/SyTwy7wfW7gp4WCLK5VI4xDhNB9BAQmrKL
 UjZSwmiK64KkS4KdnAIgCcRXxRkffJC6f3ems4jjNP/QDOQCscMEEHlqjE6+w7u/EfADgAfKSax
 FJYgmGuH2UpCys4OX+wTG9mgrA+CQ/WVwY0eBKalLhIaxcAaQjQ==
X-Gm-Gg: ASbGncuI6qtK8lnkfJe6tJG+oNiVECnwM+uhGlyBlDlcd9pM1+nRZ4qN1AHeYg35vmR
 Wejj9wyihhS8mqVfyMI50W91AeWb+BOIGBxJt2mb8b8/mLuWpOluR9X2knrhL/+bc/tw0wS/zLg
 XALKZiY21Sd2EExqzFCz6bb3OPFnkufb1c9Q16ZSRs81PP3DbZsJmZBq45jP0hZfSFYHcn7OX6o
 BzDR5jT7DYcIFVUzn0dqJKAWnnwXSgM43/w9hghwoLrY8Mi2pbEl1SaRiU=
X-Received: by 2002:ac8:5e0b:0:b0:471:89f6:838d with SMTP id
 d75a77b69052e-471dbcc0ea4mr249063201cf.2.1739917870220; 
 Tue, 18 Feb 2025 14:31:10 -0800 (PST)
X-Received: by 2002:ac8:5e0b:0:b0:471:89f6:838d with SMTP id
 d75a77b69052e-471dbcc0ea4mr249062781cf.2.1739917869934; 
 Tue, 18 Feb 2025 14:31:09 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47202b63216sm10877761cf.24.2025.02.18.14.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 14:31:08 -0800 (PST)
Date: Tue, 18 Feb 2025 17:31:05 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 imammedo@redhat.com, alex.williamson@redhat.com, clg@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: Re: [PATCH v3 0/5] Fix vIOMMU reset order
Message-ID: <Z7UKKQ1objwqqguG@x1.local>
References: <20250218182737.76722-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250218182737.76722-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 50r1-KD4BJbG4BHV0SgzWwmNIWrYuX8vLkN8hkf56Xo_1739917870
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: o92Kfbtyfm/W

On Tue, Feb 18, 2025 at 07:25:30PM +0100, Eric Auger wrote:
> With current reset scheme, DMA capable devices are reset after
> the vIOMMU which translate them. This holds for the different
> IOMMUs and various DMA capable devices such as virtio devices
> and VFIO ones. With virtio devices, spurious traces can be
> observed at qemu level such as "virtio: zero sized buffers are
> not allowed" while for VFIO devices, translation faults can be
> observed at host level.
> 
> Virtio devices use 3 phase reset and virtio-pci devices are reset
> in the 'hold' phase. VFIO device reset are registered using
> qemu_register_reset() and as a consequence they are also reset
> on 'hold' phase.
> 
> Note that the tree of QOM devices resets depth-first but it does
> so while enforcing the 3 phases. First the tree is traversed doing
> the 'enter' phase, then the 'hold' phase and eventually the 'exit'
> phase.
> 
> However the QOM hierarchy is not built so that vIOMMUs get reset
> after the DMA capable devices (IOMMUs are using either legacy reset
> scheme or hold phase). Changing the QOM hierarchy does not sound
> trivial while forcing the vIOMMUs to be reset on 'exit' phase
> sounds reasonable and much simpler. Obviously this relies on the
> assumption that all DMA capable devices quiesce their DMA before
> (ie. during 'enter' or hold' phase).
> 
> This was tested with qmp system_reset and virsh reset.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


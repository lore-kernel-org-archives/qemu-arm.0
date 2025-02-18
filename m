Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp400435njb;
        Mon, 17 Feb 2025 17:15:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUakX49M1StRrfQf3BzLG+QhwPo6v7YLi9W4k4oCjvoJhtK1QvY0+QShrGy4k/HKPnXR1IDRqe5/3mY3A==@linaro.org
X-Google-Smtp-Source: AGHT+IElovLYQFte1GfpBxGa3M9p2UVmNLgF3Ss6oJ2kTTjNrMaK9ZBlaANwDh4lZHRmDiVpnBZU
X-Received: by 2002:a05:620a:2493:b0:7c0:7aab:b31a with SMTP id af79cd13be357-7c08aa7eb77mr1867715185a.55.1739841305103;
        Mon, 17 Feb 2025 17:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739841305; cv=none;
        d=google.com; s=arc-20240605;
        b=GJJ1y1sCGrVbwhIewMZMatGec/zV3z4Y/xB4lt+gn8cv/X2fQB3uvuVwfN5zrkv3u2
         EOTnpFjK0FPPK/RZe3URAPr76iMV/xaZeoPJi9kteWbmA64bZBj7XAm3B3c0WcXJA3g5
         RriLeWlmCqk/KvQ6a+iv7wUAuMw/BcUcNGLNuU6Q+qtvutGYQHVbSz5fKrJskcfoPEMW
         UbYi9hb5BogXZU/StTKERqmF/d/rP91aZAtTX7glK/YpKhoNHVCri6sqo5eqO4b/9YCT
         kAHf7otHIZtsSDz4ksc953BqxiuL4Bamx+0FIu4YFzr7jDJ4tBOC+h2LMtVLbfjiwpfw
         qing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+QKc2rW0i1wV4Fb2kzyC2Hy9fnWSA4bTzdwDG7iLwSE=;
        fh=xVdCQvr2O+XyITJ8tBZ1KFGITbgWLfAu/NuegoA/hoM=;
        b=RCoLluoQ9pGrFEaVJGYMtUfh9T/WmuwvNL/WqX4+xPMSRySSIH+c/7lDgfPDAXllcj
         mvE34a/QcYDNsT7+9Xs+faouemThGi2hh+TJ5vZpMFST+vKxA56TLS3C+RDNi3VbHucf
         sp00AHikZcfeEtu+IJyhezaVV4p2zJUEPR33ieOT7Lyq6PEaY32s57nvQCxNVp38FjlZ
         aT00xo108dC09ykabCAanEq26eXSGdNkmGLoe39zVYwHh1HTF0x3W4YM3OrmXfsmJFz6
         r7AYlxlA9guNMI7jcsVys8QfVwKwByIubRF7HSg2ftVA1XTVbGndqVznHXZiRTqMKwRN
         0tBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CixYl+sz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c622b40si1009944885a.16.2025.02.17.17.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 17:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CixYl+sz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkCBt-0003l8-JW; Mon, 17 Feb 2025 20:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1tkCBr-0003kj-NI
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 20:14:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1tkCBq-00063a-0A
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 20:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739841258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QKc2rW0i1wV4Fb2kzyC2Hy9fnWSA4bTzdwDG7iLwSE=;
 b=CixYl+sz//CiTBvgZtei3v1u/eA00h5wXo5hCbLVvm625Ezyf8rJ3W0atCq2R1u/+W/vwv
 x07Jxp6KX/paEA6EDS8rG2KxQAj0u9ndpw5RSdeMZCC5R67FWuvhHdNCHR/OptUB7erYnj
 F7Kitryu7/HZ5tgyrV/dQ7/pXDtXuWU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-BqnUhZr6OtqQtEiHb-Y77A-1; Mon, 17 Feb 2025 20:14:16 -0500
X-MC-Unique: BqnUhZr6OtqQtEiHb-Y77A-1
X-Mimecast-MFC-AGG-ID: BqnUhZr6OtqQtEiHb-Y77A_1739841255
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2fc318bd470so6961703a91.0
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 17:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739841255; x=1740446055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+QKc2rW0i1wV4Fb2kzyC2Hy9fnWSA4bTzdwDG7iLwSE=;
 b=Hhrm09G1KEQABk6MUmCQRFQXibozGMN3Ae1SI8jPdtfmsVMrJV/sllR+qGN6gLWkkY
 B9uyVPTtn7vZZm2eESXs+2UDyAsoeU+emW44JlBIYiRxmuwjZ6vDJg0Sg8M0T5XJCFWj
 HTu0YHr6JlqL79AtHVAYrcURWSDocCR6BP7Y4zpGpf6l5qlM3IXbkPHsFEGGzUcBS7GV
 uBX7HsbbUYx0bPLVhN2Skwe3R/ybXV6idE29EoPv8wMGvlbAaZgg4LKoY9SaYARG1T41
 oNoZmRk+NFcf09K/ka1jln73sGqkOjnRrejar+cE3mxDIgrD0ASPT4HPe8m8Ly9WHuNp
 AtJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnOsz3lpVzRppD1d07+C15J4LR8qWI5HPYjq4gapqQFwCGO9IGcxluTwIk+AVbCi7d9Bn6YJNXBg==@nongnu.org
X-Gm-Message-State: AOJu0Yxqc/Eyz8As8nBv4hAdC4Y8rWyP8tHp1U6tsUkc+4AxPQjRv/Gz
 P/8ZCYIKVVcfeK4Bw26Y2YWbRIkoGg/mDw6L+ZE0b+c3uNMHV0kcPyLYrM9PW79wokllCDL75ya
 H1yp5x7ZhdgQhbuAIRdSvDIRamNefoYWtA/sDqV4BRsAYYR/CPMrpBrfDBXyWCloK/rMSlzOdek
 6w1eX7oRO6KGVW2dBkk8uBn0qn
X-Gm-Gg: ASbGncsfbTiInL8Qoqu6VBSnDW3toIn3QFIIJHkZ4gkvT4ufek3QKgHFYP6UvSqt4Lc
 XtK61vKBHg4EAZb+je32kStAgyIKUBCH8zePW1mvHLJk9Ta4yMZbN6OL86H6cnQo=
X-Received: by 2002:a17:90b:4d87:b0:2fa:1e3e:9be7 with SMTP id
 98e67ed59e1d1-2fc40d131d9mr17051778a91.5.1739841255327; 
 Mon, 17 Feb 2025 17:14:15 -0800 (PST)
X-Received: by 2002:a17:90b:4d87:b0:2fa:1e3e:9be7 with SMTP id
 98e67ed59e1d1-2fc40d131d9mr17051740a91.5.1739841254908; Mon, 17 Feb 2025
 17:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20250217133746.6801-1-eric.auger@redhat.com>
 <20250217133746.6801-2-eric.auger@redhat.com>
In-Reply-To: <20250217133746.6801-2-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 18 Feb 2025 09:14:03 +0800
X-Gm-Features: AWEUYZmcL4l4IpCMxpmu4MjRrSZnsA3hNG9wOACjiC59gINijRtHbheMI2NqjU8
Message-ID: <CACGkMEurfw7Sq8ctLj99QcY_mhKGcqCd+NT+p+suJPUW1NLoCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/virtio/virtio-iommu: Migrate to 3-phase reset
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, mst@redhat.com, imammedo@redhat.com, 
 peterx@redhat.com, alex.williamson@redhat.com, clg@redhat.com, 
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -PXnsMxn0RmTeqL5wzi43C8LUS9toa-2SgLAxtpT9XM_1739841255
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
X-TUID: zSWsTb0J/ewM

On Mon, Feb 17, 2025 at 9:38=E2=80=AFPM Eric Auger <eric.auger@redhat.com> =
wrote:
>
> Currently the iommu may be reset before the devices
> it protects. For example this happens with virtio-net.
>
> Let's use 3-phase reset mechanism and reset the IOMMU on
> exit phase after all DMA capable devices have been
> reset during the 'enter' or 'hold' phase.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


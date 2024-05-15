Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp797893ejl;
        Wed, 15 May 2024 10:03:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5qRqvg9OknMBxEQjpUSRC0jAXzdFW9s0eSxXmhNkaMPD9GhrOErsZb1ChijXP7qHx0bdIaHpeNFFNprKqNnVkCmwGHTzM
X-Google-Smtp-Source: AGHT+IEi/sw7c3Ast0G0sobJ9/U9dn7wIXIL58zrKg+lI+v25D9BlMAHO6DkXu5Qo+yM1AHU4LaM
X-Received: by 2002:ac8:7f10:0:b0:43b:1546:f8a9 with SMTP id d75a77b69052e-43dfdd19877mr182821541cf.51.1715792629095;
        Wed, 15 May 2024 10:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715792629; cv=none;
        d=google.com; s=arc-20160816;
        b=L5V/ybMRAvTFNkalHTmxSPK+V0Jy9mH+9qHeztppiKupxCfYA9yN6rcQC1MqPTzASX
         NG133DhrcwQdVOcVmBtdybV/zyCNNddJvdtVs8YT6lQjtzWNgTXEQ8qcDHkm339AmWqW
         VQPm7hJVJbw30dTamMew1V0OHGk3fopGpPAcB4tY60M8qW8sDoty6+kEaHEaLJv/6frk
         aFigusq1DyYYuBzqcwlfOuAP3ywweExS48p2oWB9tvy49sQuxk8gUdk4hPr5pAuAD5e8
         z+NoTv9ffr2uk1Cx/+1tYWqr2K1x9Fgca8JFKH6bBOyayk/yXM8GI5TJ91TC2FLaxdWW
         R4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zHzZKpr+R/trkzulSWmztw3W94xLQKywuukpC69CZYI=;
        fh=ClaxXbrgMldGuASEOd6CwvRIBAVoutlkPyru3+W15RQ=;
        b=WPkEZtytuft4DAGR/fJ0myp9u6nCxvn58WQ5Sye1b/hcqSapwj92iDAeGJEgNX1luZ
         2xJtSExyoMWs7DodFtxRaiQ5WK6V9daMS5SNKym4tgMnDrqn2QQm1u3gFrqdTRefXDVc
         P902hVBydIZ/pJi8tt2Uer2PTJGB4oRFcr8IsSl1Pt+FEyvlGzEQAzma1Uq5grywQzJv
         Zlh9c81bKoEoZR28qpmDAG82wW3WKrlX31/ToxX/XxJc0e7XLSnrL93V1VxFxvzwO06Y
         RDJaxNf08iKJ0/SOJ2RzPOrAWiFA4fHHR9iSfpnVdeC4bDiDR1fVOMCSJNA24RCmlXrD
         zHHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fKsLSqkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df549f6e1si142479301cf.74.2024.05.15.10.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 10:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fKsLSqkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7I2a-0004bK-6z; Wed, 15 May 2024 13:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7I2Y-0004b0-K7
 for qemu-arm@nongnu.org; Wed, 15 May 2024 13:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1s7I2W-00087w-Jk
 for qemu-arm@nongnu.org; Wed, 15 May 2024 13:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715792619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHzZKpr+R/trkzulSWmztw3W94xLQKywuukpC69CZYI=;
 b=fKsLSqkcG2ZBjURpp6Y/FUr/YRCfBojEJgs5EKoVANOAUi+B5XeDPZZ+omMWTrha/EWSHQ
 81lJh1DvAJknGXFmCVslYtpDcgJNnhxaO9P4tPK4930fQBask2hq/nMC+Jep7GX7oOldBC
 N7k7fkojJ+NlhlJLEWr2GC7mYMkUMFU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-wWOJVlCFOx2klt5giRkuqw-1; Wed, 15 May 2024 13:03:38 -0400
X-MC-Unique: wWOJVlCFOx2klt5giRkuqw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1ec5ea746easo20116015ad.2
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 10:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715792616; x=1716397416;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zHzZKpr+R/trkzulSWmztw3W94xLQKywuukpC69CZYI=;
 b=kdBggS0cSypzyxkld7cgMupz/LvTFoYtrA2LobaPCl4KWUwHrQV2VfrCkeKFFmFupS
 xKBh8IPG2hY/Lbr0uzP8D6wz6cZKVJQBte2JLK9tuNDLEFV6miULsZ+n3pDaTZj1/TVN
 OtPmUv3yLcLu9u/iAPQddhjk4Ub101Ja4pPYbZhayBkpYPYHn2tfDTRJMByFNPtntYfJ
 KyUj+FYQ3EDIHrtwZMNH4Vdw0mzajmmXs8i7RILAQVUQX2JciFjmfWhNdlJ5gYSiu3ua
 MVI6vxHrPdE181rirWKb9oeAo1MRtFMT0g/gV4mzrU4GHrnW7YIIi/YWRu91x2TBW0h5
 sc/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHItCHL3aeT4ruRQ1OXzr2I65kXeFBz/T6ECXnk3cNvdavcdxQw9VFOexa25Zp3gUTyiv/gHdGZ+dier730Ia72iuj
X-Gm-Message-State: AOJu0YzVsslDI0cURuDieh8KIBmYRH49EIcDXy8X4Sy1G4bhJ/G7PCrK
 DxwGuNTKi85p9BQPkQndmV1HVkFrKr+lDIwujW4ixhMsMnwTVOWoHGYri/tsLEA2p/sIsWBgI+s
 cTDSlaDpgYZnypay5x9aGHUEPvoFSMSr9tO7IWYolV1v2BsruBg==
X-Received: by 2002:a17:902:f547:b0:1e4:397b:492c with SMTP id
 d9443c01a7336-1ef4405836fmr191183375ad.4.1715792616470; 
 Wed, 15 May 2024 10:03:36 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:1e4:397b:492c with SMTP id
 d9443c01a7336-1ef4405836fmr191182835ad.4.1715792615810; 
 Wed, 15 May 2024 10:03:35 -0700 (PDT)
Received: from x1n ([50.204.89.32]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0c035d0esm120355245ad.189.2024.05.15.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 10:03:35 -0700 (PDT)
Date: Wed, 15 May 2024 11:03:27 -0600
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 5/5] virtio-gpu: fix v2 migration
Message-ID: <ZkTq3xBP-0UiLV2X@x1n>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
 <20240515141557.1277999-6-marcandre.lureau@redhat.com>
 <ZkTc4Ott5M15k55R@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZkTc4Ott5M15k55R@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: vLOxQHbyvDVW

On Wed, May 15, 2024 at 05:03:44PM +0100, Daniel P. Berrangé wrote:
> Above all, I'm failing to see why there's a compelling reason
> for virtio_gpu to diverge from our long standing practice of
> adding a named property flag "virtio_scanout_vmstate_fix"
> on the machine class, and then setting it in machine types
> which need it.

The reason to introduce that is definitely avoid introducing fields /
properties in similar cases in which case all the fields may represent the
same thing ("return true if MC is older than xxx version").  Especially
when such change is not bound to a new feature so in which case it won't
make sense to allow user to even control that propoerty, even if we
exported this "x-virtio-scanout-fix" property, but now we must export it
because compat fields require it.

However I think agree that having upstream specific MC versions in VMSD
checks is kind of unwanted.  I think the major problem is we don't have
that extra machine type abstract where we can have simply a number showing
the release of QEMU, then we can map that number to whatever
upstream/downstream machine types.  E.g.:

  Release No.         Upstream version       Downstream version
  50                  9.0                    Y.0
  51                  9.1
  52                  9.2                    Y.1
  ...

Then downstream is not mapping to 9.0/... but the release no.  Then here
instead of hard code upstream MC versions we can already provide similar
helpers like:

  machine_type_newer_than_50()

Then device code can use it without polluting that with upstream MC
versioning.  Downstream will simply work if downstream MCs are mapped
alright to the release no. when rebase.

But I'm not sure whether it'll be even worthwhile.. the majority will still
be that the VMSD change is caused by a new feature, and exporting that
property might in most cases be wanted.

In all cases, for now I agree it's at least easier to stick with the simple
way.

Thanks,

-- 
Peter Xu


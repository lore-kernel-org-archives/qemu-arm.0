Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5904482lff;
        Tue, 14 Jan 2020 11:08:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+4GvODvjcR/tIre8qNNDZXWK/EWQVX2saLLzXJZBVS3IeYmU218O/1Pjf7PbH88DxPRzi
X-Received: by 2002:a37:9ec2:: with SMTP id h185mr23018185qke.14.1579028897438;
        Tue, 14 Jan 2020 11:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579028897; cv=none;
        d=google.com; s=arc-20160816;
        b=o6soOifWH6VoqabEuAz2lqgi1sbNPciDb3enpqvJOv3cgyfxbTw/7iMtwnMZJeId7a
         s8SC3MCPssM0okv7RENfWRZ09L77wB2BfaBB0vLWdz0RkI6gMUhOiCcBcZC+QYmk6ZQB
         qvTcnraa0rIvYpvnqZ7wNH92d1nu/Tn0Zyyl8iedwC24NhG77AVZETFyKJXcZuUW3o5m
         lM2X0tKPiECeQACT0+bzrNSLpUiZMgjwAXY8ZIZcaYBqy6E8aW8GjLDQqTzAGjGN+znq
         Wt+sOKJVe5cLF0AwLvb4KYMiI+WeJAjST83/rQsT6aSdRoFanlVHw/aVEJj1DJ+oSCkd
         Hyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=T7+E+M/83fN9QRNL5Qo1aVenvIJeDzWwKJWwaKWaUV0=;
        b=iiHwuU8/oi5WMTAdu5xe4b2q887wI9DOhZASiPVyxzbkrYf2zP5RuFjCVskv8sDWf+
         OLjCBIlDaEvmcE/5phTnQkem2btPFhhHqrWcGFqZQvOFLXZ/VMbb9TjxXzfDFvDkr50p
         rPgPrCoVJErlqVV78q9fVNs9W/WeJs4hdXmiTyDNU6IuDR4gXptyIU3DnaVDhdvIkVac
         ibfvu18NEMeYPPXlk0nQIJ9BXrB9plElkoFeT7TUGolvj2cqVjFQCljNXSVIN5BKlIPs
         gyMwY754oaBdq9LCZtnXtHG7QxdJtrIbxC7i+R0/plmMRBd6jEB/+RXnE61fIqZ5QhAn
         Hu6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JnHB49aW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si8558061qvr.86.2020.01.14.11.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 11:08:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JnHB49aW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irRY0-0003yi-MC
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 14:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1irRXo-0003yB-PB
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 14:08:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1irRXk-0005JT-F6
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 14:08:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40078
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1irRXk-0005JH-Bm
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 14:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579028879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7+E+M/83fN9QRNL5Qo1aVenvIJeDzWwKJWwaKWaUV0=;
 b=JnHB49aWRgda/augL94vf/oNFftzfWxCLUDwGKR5/VcYdY8GKDH9wmeGRrCr3Qf8X2RMQC
 brNDwMSf2wcSVIyhTabxJcXuneyJLcJNgOuf8CD4u1Y3+RBlIqljIFxuUCtH9pVHMPjlfE
 cVIfsQZjmisyVOW4hoIARjgJZYcl5Wg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-wWGweNxiO_eyVcPsAPSw8w-1; Tue, 14 Jan 2020 14:07:58 -0500
Received: by mail-qk1-f200.google.com with SMTP id i135so8976243qke.14
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 11:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=di+83TqLwbVav26htNA2ep0eEvqfoQNUaBlK3etEOlg=;
 b=bO0z5DhEptP+kBMzvnrcrvUB562yqchH4HmrAsZ2U2WbwT0+mLzNsLEDrA2IlGyDCo
 nWTsRGGUKy1TKMzMzeYGtHtptCuQVAuNHV6fn+zyeb2WK47rAJDypyuX89YLAcfmB9J8
 ROtNNu6WrgiE37R/6j9Rh6ntfaVZBdCuMEoDezmGGqlFDIB36LibAzmLb3tj8S7oJcM8
 Gue0dnJhJSFk22mWbNqKCh/QP2qLpZzo5m5GFHFH9t8SKCAIetd0e8bK2sVFEcqTw38A
 c4Ub8HfO3ClM/gTrnB+VOG90KWE6SPGeLNn1gSZDKK2xDHvoMOO2BKX5vqdI3OwUVbZs
 rStQ==
X-Gm-Message-State: APjAAAVQ6RLR5kJpl0wn04RUkB1lQSf1WW75E2jx4YRv6KRrom3N4Muz
 1XFtfs+wJPMyoYeBk3kJWk8IylioIt3K2mu8TDyQqFdr0wVNias/r4j98nfEinBtzTBgN+ps0Me
 zoFSeH7t4OS8d
X-Received: by 2002:a37:9186:: with SMTP id
 t128mr22062161qkd.180.1579028878124; 
 Tue, 14 Jan 2020 11:07:58 -0800 (PST)
X-Received: by 2002:a37:9186:: with SMTP id
 t128mr22062135qkd.180.1579028877910; 
 Tue, 14 Jan 2020 11:07:57 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id d25sm7045265qka.39.2020.01.14.11.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 11:07:56 -0800 (PST)
Date: Tue, 14 Jan 2020 14:07:55 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 12/13] virtio-iommu: Support migration
Message-ID: <20200114190755.GF225163@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-13-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109144319.15912-13-eric.auger@redhat.com>
X-MC-Unique: wWGweNxiO_eyVcPsAPSw8w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5fCSn6uvLeBI

On Thu, Jan 09, 2020 at 03:43:18PM +0100, Eric Auger wrote:
> Add Migration support. We rely on recently added gtree and qlist
> migration. We only migrate the domain gtree. The endpoint gtree
> is re-constructed in a post-load operation.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu


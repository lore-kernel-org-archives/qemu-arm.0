Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3367424lfg;
        Wed, 26 Feb 2020 09:57:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnxq57uq9qP10ky8y+s0NNx1a4I7PvdKFR0EVusye2IMLpqW6cqeE5/8McTHmZrk6PVVCl
X-Received: by 2002:a37:a00e:: with SMTP id j14mr337153qke.464.1582739876728;
        Wed, 26 Feb 2020 09:57:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582739876; cv=none;
        d=google.com; s=arc-20160816;
        b=xGLy6WtOc/A7irb8QPJMRsWek3GhNzx2dveKaYe+DiHSOhtbO+w8GOZ9SQ0hG8Wo8K
         a8e8UE8rOTGIDoNS3c2AzkMv3Wq7FuScT317VtuCP5Y5SLFSfC2yu7rIlhS59qh+XoAr
         O/+tQ6XTSVNNo0ayueBNGGB5215gnZPxHGZzHFX/AcwR+QmuLnAQI3fUl+OTJY1UmzVv
         o8DwxKLsi13h0CT8HtllzBEcSvueS3u9kaoTanWSBScSbngb0V6sS8xBUNYdxNunDUfT
         w9iodP3URC91DJXbt2iqq5G1kX7bHmjVFWu+BT1OspNZThMmA00WMDkwDqvdvCrYsO4n
         Sztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=sebDUYLrDxN15HjxAKvkmNDKIlwQORdu5M9DKS14gEc=;
        b=gjmMjCg6hkmSQ7Rm6TX4BQfsbduR5TS2avm2/RoouJZ/cZWRXB9pQNTQ06LGFY0eNl
         zBHagEhaIO48pMjUNwgZOKOcDkoOpqs7Ayvc4fwrYy0KWZOvEnSIUJAfjcrU0rLcSZE7
         TFqnS9W9dlAzkYGLqqRwh22fk46mLKiHncy2b34LFfeGyCJhG1ants68LKIW9XhYQXKB
         nr+T2UEbnmg+/vIV6lNg+Z1Yj5Euj9AmB9vosfHW4s26JLjQioCvWMNlcgHWx72/fTJw
         A05PLQ6s0sLPhDvbDKSEZUV4zSzCpWClcNpHK4cioEbm6pyA0DsljJBs5eZgBX5QSQ6A
         8w9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bpC41Mul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g23si81079qto.236.2020.02.26.09.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 09:57:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bpC41Mul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j70wW-0005aQ-5P
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 12:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j70wO-0005XX-46
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:57:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j70wN-0004wb-84
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:57:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24823
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j70wN-0004vF-4J
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582739866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sebDUYLrDxN15HjxAKvkmNDKIlwQORdu5M9DKS14gEc=;
 b=bpC41MulwqQEgj1DlWe/l7eexHCIRv3OvhN7g+vkNv5JOmg4bsDYAGtQncMt7oe3ELONNw
 sNWuCxtmmUc78RmpuilV0vtEu4Jf53WHl18Q8tbkAr2N2NyoK4cCvyrhv5wdnt5YDSr4bC
 9EHBZUpTNqkemWZz7UUp65daIIhxRxk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-eYZkNjGjNhyzPEOQpecPEA-1; Wed, 26 Feb 2020 12:57:40 -0500
X-MC-Unique: eYZkNjGjNhyzPEOQpecPEA-1
Received: by mail-qk1-f199.google.com with SMTP id c66so159839qkb.13
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 09:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zIyV6cYTxtRMRBEZz9p+gZhtydpVS4YQXL45UhS0xXI=;
 b=HND22NaRbtF3ao61SY4g//9bbCv4EJIXSPBXPmI5vj4DDWKDOmlLHWrCQ4RGbd+/hk
 wPve2+02ZZca2c+CbDADG6xDTyLFeEPAR0fS46tZxAOh11VTYKEvemRYChRnJSKmo3F9
 Rcqy7EyhJafzWR+Jq+zbpwFnDtv/jJgbthE3d+13DFMVEakk3OvfITNWd+qSKy38+2pA
 zzZLopTsC0RWo11DKUlroTOagnkh2o521qhSN05wTUk8f9sW21PrnhqwajjwcVIKAKe1
 NAYQya+2j8b3A+zvghH527FOVxf+wGM6/983iCSMhDFzfOYz+xphE9fEA24ezlxlNDRI
 49ew==
X-Gm-Message-State: APjAAAWF1sGxLwjNO+yK+vF6g+S569eWC5w/vkQzsce68tRy8/O/DcYU
 POwYG9y8BFJ6x5+jP+yJz7phJYTtFhlducBnCPGoz1ZYtu9s2iDg29nJwOiUZhbVL34+P6bWa5P
 YUw69lfE+voag
X-Received: by 2002:a0c:e408:: with SMTP id o8mr284434qvl.236.1582739860030;
 Wed, 26 Feb 2020 09:57:40 -0800 (PST)
X-Received: by 2002:a0c:e408:: with SMTP id o8mr284407qvl.236.1582739859731;
 Wed, 26 Feb 2020 09:57:39 -0800 (PST)
Received: from xz-x1 (CPEf81d0fb19163-CMf81d0fb19160.cpe.net.fido.ca.
 [72.137.123.47])
 by smtp.gmail.com with ESMTPSA id r37sm1463731qtj.44.2020.02.26.09.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 09:57:38 -0800 (PST)
Date: Wed, 26 Feb 2020 12:57:37 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
Message-ID: <20200226175737.GE140200@xz-x1>
References: <20200226172628.17449-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200226172628.17449-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aeVIk+nPOFJy

On Wed, Feb 26, 2020 at 06:26:28PM +0100, Eric Auger wrote:
> Make sure a null SMMUPciBus is returned in case we were
> not able to identify a pci bus matching the @bus_num.
>=20
> This matches the fix done on intel iommu in commit:
> a2e1cd41ccfe796529abfd1b6aeb1dd4393762a2
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu


Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4046592lfp;
        Mon, 10 Feb 2020 08:47:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHbLOv2tLBCP/DnVf3dksclaBeyGNfeSvdg0+Dcf1fuCxHLsNVdGT20pl8XnwWXw7B8pO9
X-Received: by 2002:ad4:408c:: with SMTP id l12mr11043257qvp.164.1581353237108;
        Mon, 10 Feb 2020 08:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581353237; cv=none;
        d=google.com; s=arc-20160816;
        b=FonWJZfFGQA6Hh6V17bncFNzcuLtdzZam1Am5BV1EO0Qg9UcJpiiLWficuQZ8PO7a4
         0vdn9geLNp4xaJ4KZfkie0g3KxtBdiukzCyx6r4hIuV9Phe060VZKAm/jLFDW7w78m5f
         qJHmyCdtvlANckpI3wmHkRoXUEQ2b3L13jDDZtTqfgCzDUO9goU5GlZ20nle484NnUxD
         lFoss8EoXsHpnKb4eANJfYRzErBMqa5CKi2wMIzfdaYs1uI9ouZSe5+WCcomN2aS9hwo
         YpMhyS0vqFe91BE8qHndGbWdqE9m0emuVuyY5eR082A7TXxK3bADHqwrxxk0HIfqD7Cq
         /3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=kg7GL+6Br1Kb49XvJufnA5wYcwECH96txwxCi1gUjpI=;
        b=lli3NlYjf2BfByQa/nQkNls7CR8b2PsRVO4xNfsJ3X/3elj7IUv3TufFTT3UyTpzhW
         hdFL03SM3ifKGJi8vP9b2z/Jv9pWCR24a7gJXDVtYCWSZihxl4qzFd8ILbFbCsNLFHAb
         FSFdQcPqRL1LcpIX2VVjs3TxVAe3yhh71lcnJg85hVshFmwB8lAs0gnwKry88Ueq/IbV
         MmNRbbUqz4pCIigpOP4dEK64POzHNkaS2kMojqqHpGY14dUmmwnHLrO/1xkgFlUihg9i
         gK0h7IAGSkx1mKas+iFRBKu65HoP8XXLAZuFaEnvAfQ3QHajbAjvvdsaEbfO4BPm9EV3
         s9Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J/tbdenU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d27si383213qko.324.2020.02.10.08.47.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 08:47:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J/tbdenU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1CDM-0007bd-Hc
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 11:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j1CCP-0006my-II
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j1CCO-0001ft-O6
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:46:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40065
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j1CCO-0001es-Ki
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581353175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kg7GL+6Br1Kb49XvJufnA5wYcwECH96txwxCi1gUjpI=;
 b=J/tbdenUoBNQqnv8fcrAqaOlcBa0IYG6eYDWlDVAQzID+vnADcMPFfGe4+z2Qz61UhS5XP
 d43fRFmKYfmA+eJyzQFVkca+Q+eQfK0XCDQtaM60soNVMIlg5eMP2/gOsqq1uczg8beiVv
 ZUzQfQcGvaPXuhIKoYmLR/EEaJMyXHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-BtMMQxq8MwepUcekDWaLUg-1; Mon, 10 Feb 2020 11:46:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F76C107ACC5;
 Mon, 10 Feb 2020 16:46:07 +0000 (UTC)
Received: from redhat.com (ovpn-117-6.ams2.redhat.com [10.36.117.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9D425C1D4;
 Mon, 10 Feb 2020 16:45:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v15 9/9] virtio-iommu: Support migration
In-Reply-To: <20200208120022.1920-10-eric.auger@redhat.com> (Eric Auger's
 message of "Sat, 8 Feb 2020 13:00:22 +0100")
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200208120022.1920-10-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 10 Feb 2020 17:45:57 +0100
Message-ID: <87y2ta5r22.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: BtMMQxq8MwepUcekDWaLUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3x9aDwp2/YXM

Eric Auger <eric.auger@redhat.com> wrote:
> Add Migration support. We rely on recently added gtree and qlist
> migration. We only migrate the domain gtree. The endpoint gtree
> is re-constructed in a post-load operation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


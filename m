Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3565823njc;
        Tue, 19 Nov 2024 13:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFHYsxDNvEylakR3eIrzWy9YK1p9NFvMYy9R+3LdW741uzNBX73Hrc33mWRyqYtTZAZDJflXfRhlLHeg==@linaro.org
X-Google-Smtp-Source: AGHT+IHZqzwknbXyRZe2GO8Z5xbzZRyCVCEBIGwfHKj2At6gGfjWWlCSC+ajLbxCGfI+XtSla966
X-Received: by 2002:a05:620a:4109:b0:7b1:8e09:512b with SMTP id af79cd13be357-7b42ede4b92mr66788085a.24.1732051569475;
        Tue, 19 Nov 2024 13:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732051569; cv=none;
        d=google.com; s=arc-20240605;
        b=d4k22BZ+3UbvriIb49NYrqj1OEsYW8Ewi94Bg6tNmHQTVZDeDFsYidSdFsl4kyBIHm
         N99wXuQC5+ez/DBm5H3yEJ1IyQoApXTeBQbqAb4X4RyIPY9BEzeJVCIRKmFODC8LkY2G
         PncJgZHBkbpVo4gZkBtKYs7MdXY9bXm2YxqlxVVPO1B3mk5XBNLgDI4dkfN3ABJjCFmX
         Miuaa45cYh0yUjOdD4TyHSdDH6IcaCKy2xY30gxXL65f4/mI/B7t0F/jRPrKX/SstpFN
         aMQ6UG4pJliOuKKX/azVPhOzVvyywYQ8VT3nEfJoldVWfuTkq2HGi4XSC7BsGQ2UzIrI
         tcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NKMn6fMYeGhzOp2bAc6tUoPrS/44I1gCp29gOOd1Hdk=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=FOywgk2N8Onf6CBb30xZcpkmuga2E6yk3kbs97h2j8fKZmTiDM2hXh3HOPsZp4KUr3
         yYZRazOxiZ3SEBVJ7/eqHG1U7ksVjxkKvGvaqxKiHUjBkqK8BPqtvlFXMepQfKxc/iih
         aJD0Rib+ynIaGsFuTPmWlbmJpE/DmmvA7a5RfSuoXKgaHMvKVfxgBQuGso1Nrnj1Mypk
         nxvffydFxmZbECygwTTAAZNFB+n+bjWWME28iC5V+mqojVsJsmwxw7kcMhHOK1t1N5xB
         4H3C74JZcwSQM/bJJhArYbfMH7TvceR+RJTvf1T9anI/wFHNQPCDXk02Tngut8q4CK5f
         WKGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bggtepj9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b4852c271fsi6311985a.556.2024.11.19.13.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2024 13:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bggtepj9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDVin-0005tb-FJ; Tue, 19 Nov 2024 16:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tDVih-0005pO-EO
 for qemu-arm@nongnu.org; Tue, 19 Nov 2024 16:25:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tDVif-0006T6-J4
 for qemu-arm@nongnu.org; Tue, 19 Nov 2024 16:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732051505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NKMn6fMYeGhzOp2bAc6tUoPrS/44I1gCp29gOOd1Hdk=;
 b=Bggtepj9TjEkvTaeK4tIGMwUR+ko6MM6Xcevb9fEyeFGkVAIMRHguoNNuYC3f8ZP9cwlEO
 Hp1EXZ71I+A75jx+13wO/9UQy45D1Zt/SGy0MPD14s+nsCBBWQMOwxT3jcv9ZTUwjzfw2m
 D7X51Irsq5zP5oHISh0iPUc8lXv4vew=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-MwkXQTcZPru8SzdzzciF9g-1; Tue,
 19 Nov 2024 16:25:01 -0500
X-MC-Unique: MwkXQTcZPru8SzdzzciF9g-1
X-Mimecast-MFC-AGG-ID: MwkXQTcZPru8SzdzzciF9g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8B87B1955EE8; Tue, 19 Nov 2024 21:25:00 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.59])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1DE6519560A3; Tue, 19 Nov 2024 21:24:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 0/1] aspeed queue
Date: Tue, 19 Nov 2024 22:24:55 +0100
Message-ID: <20241119212456.873660-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: PIM5hNsGK0h0

The following changes since commit e6459afb1ff4d86b361b14f4a2fc43f0d2b4d679:

  Merge tag 'pull-target-arm-20241119' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2024-11-19 14:23:34 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20241119

for you to fetch changes up to 9b0a36494a477541b543fa689c635cf4912fa641:

  docs: aspeed: Reorganize the "Boot options" section (2024-11-19 19:12:12 +0100)

----------------------------------------------------------------
aspeed queue:

* Restructured the "Boot options" section in the aspeed documentation

----------------------------------------------------------------
Cédric Le Goater (1):
      docs: aspeed: Reorganize the "Boot options" section

 docs/system/arm/aspeed.rst | 99 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 13 deletions(-)


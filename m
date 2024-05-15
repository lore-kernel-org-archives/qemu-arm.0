Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp682929ejl;
        Wed, 15 May 2024 07:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHWlxZp1SdMnO4iqeiajbGhFC092VXwFf1O5DH+UtrlAuqMk08+f1ula4orBTevqShoq2gyUAce7jQOersMf+oa9g9VOOH
X-Google-Smtp-Source: AGHT+IF4gQ9EQt0KymwJ8Af3Pvn9AlDt8r1W/FfszSXXc1EpZ6+NP0gOlI38eHnhkr9qk16zraf/
X-Received: by 2002:a05:622a:1354:b0:43e:1a17:10f9 with SMTP id d75a77b69052e-43e1a1746a4mr93604071cf.52.1715782611064;
        Wed, 15 May 2024 07:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715782611; cv=none;
        d=google.com; s=arc-20160816;
        b=yxqAx5Kxy9VdW7K2M4+XMg0ktFsloOSyyI/wqdH477cXpHhhU/hDbN8JNBoSiE/3Hr
         6NKxe3w984K9yeGQmKjTJKTbyoEQ5iHZy5rbzlEG7k0iUiX6Gvak4UBAC91d1aTwIhLA
         ckqai1I/NxsbwpR4Phb5i9KQy8RBgW3S4n0g1msCKtOmmFDlomZDSp4gpikyHMeWiPhi
         gP7gB3ir97j/yM2yUs6Av779z5vY1x8OpN4mjKvQqMEyJiRW8hC1qE8pOVq8eOp3PQ4e
         lk2QMFGUzV5hNyPwtg8w+32ICIfK7Q4blEeGJTrdgVdmncu0aGQ+CERJ1EOADwFKZjEk
         Lwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SbUxgf7bDW9Dc3KIs+3blromY2juehAlMOJMQHH61mA=;
        fh=WiHjMv7b4F6gAX4kco6M6FRYZA2XZyWXbhiREiEKM1U=;
        b=aLxGfgTDKflmNzAuwFzjcsjbBKwrRvzqCvMrwb+uiynsRKR5Pp7au9j1rHZwvyXMMk
         IxwicFV8Kw2xuO4RLtDGYeWfgmh1NYpQEJ5V8T7ic3WAdl5g/3+mzqSnN/QAxqAqdb1C
         3uqxvxh1M4RgWeBZ4FGXkxkFXFMVLLgINWmA04TCw4TMA1XadG7d1NvNsKyKWRtqs47P
         otpEgNN5FVxP9WCWieODA8iUZ8ydncBAL7fQhmuVcYBMnjguvwZKIyrul9nziat1hyrh
         J1vMgc0Ya4zkeHRYU1snlqOf6vskBsxO2K5sRCFVjocERUoyztqdXm3xIPfN1ZttHEzd
         9tfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ha9OG1xi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df566f75bsi145383681cf.335.2024.05.15.07.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 07:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ha9OG1xi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7FQm-0004Cw-KJ; Wed, 15 May 2024 10:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7FQU-000447-MH
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7FQP-0005bS-Gz
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715782566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SbUxgf7bDW9Dc3KIs+3blromY2juehAlMOJMQHH61mA=;
 b=Ha9OG1xi2xatagqzpVpetahNLIUBPLQeAeIMlo1NmFIXwN5+29vASrNokoGaJyOgHMEH/Q
 A56WfPD9qCDBmarRO29MMzqpybl0YlJRE5/nBZuTFApCsphAG2PIV8MCedBd/yOpINY1aP
 yDk1zsS3oQA4zZ1V/DOn8mFjSWooOzs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-93m0S43YMZO8aZlP5Rkmug-1; Wed,
 15 May 2024 10:16:02 -0400
X-MC-Unique: 93m0S43YMZO8aZlP5Rkmug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BE751C00ABD;
 Wed, 15 May 2024 14:16:02 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAACD1C008B9;
 Wed, 15 May 2024 14:15:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?unknown-8bit?q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: [PATCH v3 0/5] Fix "virtio-gpu: fix scanout migration post-load"
Date: Wed, 15 May 2024 18:15:51 +0400
Message-ID: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: xbhxQWfMZSfK

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

The aforementioned patch breaks virtio-gpu device migrations for versions
pre-9.0/9.0, both forwards and backwards. Versioning of `VMS_STRUCT` is more
complex than it may initially appear, as evidenced in the problematic commit
dfcf74fa68c ("virtio-gpu: fix scanout migration post-load").

v2:
 - use a manual version field test (instead of the more complex struct variant)

v3:
 - introduce machine_check_version()
 - drop the VMSD version, and use machine version field test

Marc-André Lureau (5):
  migration: add "exists" info to load-state-field trace
  migration: fix a typo
  hw/boards: add machine_check_version()
  Set major/minor for PC and arm machines
  virtio-gpu: fix v2 migration

 include/hw/boards.h     | 14 ++++++++
 include/hw/i386/pc.h    |  4 ++-
 hw/arm/virt.c           |  2 ++
 hw/display/virtio-gpu.c | 21 +++++++-----
 hw/i386/pc_piix.c       | 74 ++++++++++++++++++++---------------------
 hw/i386/pc_q35.c        | 62 +++++++++++++++++-----------------
 migration/vmstate.c     |  7 ++--
 migration/trace-events  |  2 +-
 8 files changed, 105 insertions(+), 81 deletions(-)

-- 
2.41.0.28.gd7d8841f67


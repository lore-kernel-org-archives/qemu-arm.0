Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1284453dlb;
        Tue, 18 Feb 2025 23:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+TX9YRiqm6nfEnAZCbZO3GZcdZSjgwbLZp9NAJdtLnDprz4kMKlqadbPpMPy4JX4IiTynKz8ePrHd5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE4Ue7FysPBft9xRXMZb3GEpz2lF0SRiDkcUqg5qwiJs+uZL66PfWKwr9ZQH9uCmwZ7pNbx
X-Received: by 2002:a05:620a:3916:b0:7c0:56ba:559 with SMTP id af79cd13be357-7c0b536104dmr339588385a.47.1739949767109;
        Tue, 18 Feb 2025 23:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949767; cv=none;
        d=google.com; s=arc-20240605;
        b=BhPJBJ1AZd5MCoVQcaY+oI/uNkBEB9mm7pKVJSseM8Krbfz+KVWeSKu94kb+L8ZjET
         ZHVmZbSMsWUzah2bNSfviL3YNSV7djhr1bzuZLJahI7qx5qYVfPrkw1Jy9xpxugmmXZm
         EZrrIwiToi4iFEs5fhUFL+BhGnd5vMt5wSY+Vav5mCW+ymvotNNW3L/wUtcP6WnI/xwU
         xH/VB4kwhnSMhR9ob793XApkh5Deg6gJNhebEzp4VEyJRIh/u7Xws/SG8mOGrHQIzL9Q
         sPSM0009dSbUo+8IF+vrN+BgjulPMG9anzKp3fbMWy/yF4BxUUXb0cIyM6MYP0zHaAGz
         ZlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UfzJa85ik8HDMKewE83Gp4yd8DRMF01tRJCM6geVxi8=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=ShlUoFTMIzA5QEtxjN2P71Us0VCbWq58wQF/lmaVS+LAuoGWfGiCDPqMctDriBY2pd
         xiph+A0zBgVhfz3bhsJqDZm7uXI0h20tA/SsF+oYEUudTaGM1nYa9wEmlNMXYWz/WZjq
         M33aFCZcFiS63dNHqKw1dAloQke70Sysfn5bZQabAtzOT7C6oSjzx9Tv6EZvmvRQpBMG
         5uC+zrcLjsBuNDvFfbZNl64EKHRiM+nKIdaiC0QETFmFW5wPUh6RHaeyk8hUxORWtMa+
         16DEvIXvBYfPLIf6wG3Nce19pDYNakHUEUpN+Cy29qV7SravNZqtE8+kBC1wQAVgwi5w
         fDlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eWx2KJ8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0b47b2ebesi135522485a.208.2025.02.18.23.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:22:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eWx2KJ8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkeKy-0006OS-VQ; Wed, 19 Feb 2025 02:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIt-0002fm-QC
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIo-0005KK-Kr
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfzJa85ik8HDMKewE83Gp4yd8DRMF01tRJCM6geVxi8=;
 b=eWx2KJ8hNeB05ZgVXbbgvtNT3M0tCRIvy4Jy21P6ZsYISq/Tshyi1NTJWKSH7MRUpjQbd2
 Dstf/lOYmrhXoSGYTgvRK/DFVeVODlLAye+Ys7aUxkYFsKObjQ6Se4XoKskBNZUOT/jRBl
 8jpa5P9k9PqbSxphxMRkoenJ7gc3cuQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-j028VmG-Mu6zEh8Sfyt5gA-1; Wed,
 19 Feb 2025 02:15:06 -0500
X-MC-Unique: j028VmG-Mu6zEh8Sfyt5gA-1
X-Mimecast-MFC-AGG-ID: j028VmG-Mu6zEh8Sfyt5gA_1739949305
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 304F919373D9; Wed, 19 Feb 2025 07:15:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 39FE5180087E; Wed, 19 Feb 2025 07:15:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 116291801AB8; Wed, 19 Feb 2025 08:14:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 16/24] hw/uefi: add UEFI_VARS to Kconfig
Date: Wed, 19 Feb 2025 08:14:18 +0100
Message-ID: <20250219071431.50626-17-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: p99Ib92gIxJY

Add UEFI_VARS config option, enable by default for x86_64 and aarch64.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/Kconfig      | 1 +
 hw/uefi/Kconfig | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 hw/uefi/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f7d..c4dfe2e7af7c 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -37,6 +37,7 @@ source smbios/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
 source tpm/Kconfig
+source uefi/Kconfig
 source ufs/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
diff --git a/hw/uefi/Kconfig b/hw/uefi/Kconfig
new file mode 100644
index 000000000000..ca6c2bc46a96
--- /dev/null
+++ b/hw/uefi/Kconfig
@@ -0,0 +1,3 @@
+config UEFI_VARS
+	bool
+        default y if X86_64 || AARCH64
-- 
2.48.1


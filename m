Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2375504dlb;
        Tue, 2 Jul 2024 07:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuOoVCymSWwB35wDqqhkN0zTjdXcxn6ui0+YahekXqpjrnBgyb68N53TU/oLX06ACpUomPLDsEVN7MxeqqZaCJqUUB7AxK
X-Google-Smtp-Source: AGHT+IF8WMi2l4YULyYAFeyAd4/QEJunSKJP1/86fAriZuGrnUh62/ipbN1cTrai24YQJbLesrWS
X-Received: by 2002:a05:6808:13c8:b0:3d6:40fe:d538 with SMTP id 5614622812f47-3d6b4de2075mr12471355b6e.37.1719929607864;
        Tue, 02 Jul 2024 07:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719929607; cv=none;
        d=google.com; s=arc-20160816;
        b=NE01L1yeh99MFj/y+LfIkucdqOIE/gZr7491GD33+c/BxyjS1lgWtdZMd67FuSnnvq
         mrsE4IcPcWIh2VKFVQgkLBUBiA4iMRUhvxiyaFOrbRtLB2xkuTGz43Jap+y5QHTbti32
         5YTRTHuNDSmuDkdpzDjwy670nVMsp4RBG1LlNG/1SHyGr2dkqZ4OfqKKev4OpGyjSr3a
         9dpIZzBTmb9adlVVTthpJJAydilkcPuKZyQo7q0WLDo/73xWaezxdyABiPsAOyYBPJa+
         HvXRD7RgLCDlBzn4O3oMKd5O5eAmyd9/mGrRn/foW5/z0EYCUL/QXAmQwDtHFNYhFfs7
         G6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SUxXXLDnAjmmN0Yi+4nhd+mhBCkrJEwNWiEK8gau7L4=;
        fh=Y6OlZAOK4jiLjNtMJ9yraI+FFvJY3j5B3PSa8/rtbNE=;
        b=XjsH8C86vNJpAqhdixAoOfY/rBRxphDAjAwXAJaQycmlIuiNvpByaVaBZRnbmO7M43
         UeZPqVpDIh/Ps9Lklg7dkoX3x0GuWKJzvdE30uxDgWEi7J6GhsKG7KRXmSINfr155uGH
         5tOp4u1c1fyCeY9cdxgohbw/F9GPqE8SUVYE+HkfMC3o2V5+Zy5jb3GgXVfV1HgzjlrA
         bIDtcltCp7FgsV1PNSnIucCpZyyEyq4YvF0N0e0YChl2HuKOPD2LuinDw5mqd5AdnxUl
         suYoJ6pYe1gqbC7KX0VjICXr2scC8sW3e4xjxNU5tEZJTahQTJMeCnO72iX8UUa6te/I
         vJng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=guH4XUgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f292265794si1136860e0c.209.2024.07.02.07.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=guH4XUgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOeDA-0003xo-5L; Tue, 02 Jul 2024 10:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sOeD5-0003a1-HU
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sOeCw-0000Gz-DM
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719929409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SUxXXLDnAjmmN0Yi+4nhd+mhBCkrJEwNWiEK8gau7L4=;
 b=guH4XUgrJHZf19YLy3KJ6Jhs4Jjim4mmGhZL7HgmsdCcgnmnvPy1LcpuIxaEmMRPsFJzHp
 zViCeaaw3JJvhGqYKK8K4bVbYGVhyYPt8x+ufxbwVhE0JyI1yHS/mAI6rAMubWB+cdmhSb
 NSglgrT3QvB6gj0ujhZaPHsEznR442c=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-QZys86FgNz6RrgbbmOrRTw-1; Tue, 02 Jul 2024 10:10:08 -0400
X-MC-Unique: QZys86FgNz6RrgbbmOrRTw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ee4ce81697so45237731fa.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 07:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719929407; x=1720534207;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUxXXLDnAjmmN0Yi+4nhd+mhBCkrJEwNWiEK8gau7L4=;
 b=eEGwgjLC4w+fl/VT6690ZcuK4kyVh/lJ8CVzwV2WIBlYuuLfXz9RdtzxxomEuzzOow
 /QLA7EWDkBqTcl2/Iwplz2HG1dbP8uM2oHNQQm/i57AoNPXSbAbnGAgyTmdB/RYvECUZ
 c5f/7j2yB56TvVd2ps2SJMmtoxa9/yFoy6gF8MXHefhXjL8J+agxtpDP4sPNIF7tVcLd
 U9kaNyhENNcDleIHkAqsn/Q3uQuXS+SqYmDQB0DAD/DLgl2WoPXs7ZGgDa+YXir0LklP
 BEAvVXvt5Ww0Evork5w+MY1zhHzykuOCjSd9YNSjBjeMBk8gPVXHACsrsUTw4r56iLbe
 qfdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGCuL3osm0ZV4hNqDzMAfQf/9zDe4agN2UCKTD5UVWTYh67j3xlzxAcAIGH8N1+kqF4DModRFolk+q769k2rxQh99O
X-Gm-Message-State: AOJu0YwbPVL1wu2X0MDLIA24GreE8jN9zVe5vRsoEU2kGog0rBEFAAxX
 +JIqwWV550JPlSLdBbPu1QA7UD4bfluFtv87U3O1qfi+6wfhDAYsoOntivnYRghr2Egt9vWIs70
 uN/jUGHIHdQEwbmL1r6hrL1XprbfmLaAwGWWDwACw9BjaV0F6OA==
X-Received: by 2002:a05:6512:33cd:b0:52c:e1e1:ae91 with SMTP id
 2adb3069b0e04-52e8264be16mr6461249e87.11.1719929406968; 
 Tue, 02 Jul 2024 07:10:06 -0700 (PDT)
X-Received: by 2002:a05:6512:33cd:b0:52c:e1e1:ae91 with SMTP id
 2adb3069b0e04-52e8264be16mr6461215e87.11.1719929405946; 
 Tue, 02 Jul 2024 07:10:05 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f5:eadd:8c31:db01:9d01:7604])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba0bsm13305331f8f.69.2024.07.02.07.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 07:10:05 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:10:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 60/91] hw/arm/virt-acpi-build: Drop local iort_node_offset
Message-ID: <f5b7c97cbf3562a2d52337c6ccba8a73e9dc0c11.1719929191.git.mst@redhat.com>
References: <cover.1719929191.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1719929191.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /IPsnwWcieK7

From: Nicolin Chen <nicolinc@nvidia.com>

Both the other two callers of build_iort_id_mapping() just directly pass
in the IORT_NODE_OFFSET macro. Keeping a "const uint32_t" local variable
storing the same value doesn't have any gain.

Simplify this by replacing the only place using this local variable with
the macro directly.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Message-Id: <20240619001708.926511-1-nicolinc@nvidia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b2366f24f9..102e2da934 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -269,7 +269,6 @@ static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i, nb_nodes, rc_mapping_count;
-    const uint32_t iort_node_offset = IORT_NODE_OFFSET;
     size_t node_size, smmu_offset = 0;
     AcpiIortIdMapping *idmap;
     uint32_t id = 0;
@@ -415,7 +414,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the ITS group node (the first node) */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, iort_node_offset);
+                                  range->id_count, IORT_NODE_OFFSET);
         }
     } else {
         /* output IORT node is the ITS group node (the first node) */
-- 
MST


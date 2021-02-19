Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8949586lfc;
        Fri, 19 Feb 2021 03:46:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaCRvegmKBB8P+gtLDmCPcsPQOKzeSTAgF/F1w17YPVfXdZhnZLI6HwOaOOAiIHNJ1DGDm
X-Received: by 2002:a25:5f46:: with SMTP id h6mr13149427ybm.255.1613735203861;
        Fri, 19 Feb 2021 03:46:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735203; cv=none;
        d=google.com; s=arc-20160816;
        b=M4y22uMOpHq3DIxy6gFkKO18DtnxXsFYDddXSqED5cTlDcyn/uZcBMETt9mVi56dfx
         h/C4f2xWWJtolb7PQwIJXqUzRBDgrX6sPbEypiLAbMYaX5i+cLAvGoKpkyZYKp8xQS2k
         QX6T6jumm9QUfIp23xqs0ranjWnpahVSRH9Ux5a6QQVgQ/xsCsp+NXNJNiQ8xe1Mf8Ue
         TyJFX6x5Iz4+5VT8nAFBjayBkz2NLYevwBdq65B6HPPe+EKMQDi4z5YFhQGgwvhpAc13
         BdRH66HDNfxqLCOJASk4hZfck/yBySNaNvkESs7R768/YNPFFrxkbk4SRio19je7H/HH
         Cttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KroGD2ykh3pOVhGFDhJBF9D2GPtRIz+7OKOBV/uF+8M=;
        b=Iu0TEaViWriF9A/3KP4DqHs2zeO+gzfp3hwAAvF4s4/oYjiXO0yU+5j5nV7i/jOzEw
         jyovbSxSgM3IzOCuBSMJbJqfxDb5fbxmgkeEh0OSTcNLTEHpEkCT+ho+IpOozWHn9PQk
         DAyqz7qr/59PPQN1RBMFNu14Es7i4YRPlmFmCONhXeFfCG7ekHwPfootHguF9UzERhPd
         /p4yXWuoLy4Iq8PYjx0L322iudNFL6Y6ylsICgSYmsSeWp9r86pJ+CP7uTnIVALaVA9F
         WrnZOmJXI8cABMvcCn4DDpOajl4v3GhZqk/gFZLcBWJ2ZKzVI1NJ7qVfnAxa+DG6lJNK
         qAnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GJLQTgmi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p64si8245060yba.44.2021.02.19.03.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:46:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GJLQTgmi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4F9-0003FR-75
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DM-0002h7-B8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DI-0001y8-5v
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KroGD2ykh3pOVhGFDhJBF9D2GPtRIz+7OKOBV/uF+8M=;
 b=GJLQTgmi/JFLQPK/vALSqIn5FC6CL/YpjZ722xUmxF2VWzdyP6XITFq8pObi8L8xiSNawI
 gM/i4DdTHnax/bOdIbFkOR9H5HYGzBICc3mB30AE/sMw8/o5NImzHRvJkhn2W6tE1ujNSN
 NDW2GWEmqnpB86CFsFZtp9nzFFcfUZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-KEUge0rqO56a0Nxw67VGiw-1; Fri, 19 Feb 2021 06:44:45 -0500
X-MC-Unique: KEUge0rqO56a0Nxw67VGiw-1
Received: by mail-wm1-f69.google.com with SMTP id t15so4250078wmj.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KroGD2ykh3pOVhGFDhJBF9D2GPtRIz+7OKOBV/uF+8M=;
 b=smY04ewTCyLZB0QP3QjBhjRLJrHvanZYsyPM6LgYnE+aoXta7JR2Obfj1yJrlB0dGl
 /eyw0Zzr6KC+ZxYE/u63oCD+6/H6vBG7IEff4dhukbcqE9d1DaG7woe6uJEtE95f4EpS
 3hPJ6Q66V1oPxYnje5W5TEY60nzKOtxZOJ3FvYisoSybhaxCjovx2spcu2jbAgfUdmTY
 XO7QLCeJhy2c+99CukcPvQtGFcNzRc9iBEu8PX7+tDcqVbWmFB1whPa0YF4Z19EQY/xD
 xl+f0lMyHlMUXFFczatko59lcUFETdJmr9jyayvw2kur5MIrTYAn0g5HWWnqftUMKiRL
 Hzvw==
X-Gm-Message-State: AOAM530sOqmxSNPokP6EsIvgleJHH16qRLnk7q3MmpHx3FbxWL3dzI2f
 PH+iEmyjaq/DQ612sjXNHuReTEpTX29NTsYOgOu8K7C2NVXHrycqmoVlpUPdSW0abnlaBqImGCl
 66/IgQnmUtfxPndGDu8XMIItpbZxhoUodAVfnA4891Q7q3unFONd170I06CMa9wg4
X-Received: by 2002:adf:b342:: with SMTP id k2mr8775486wrd.264.1613735083664; 
 Fri, 19 Feb 2021 03:44:43 -0800 (PST)
X-Received: by 2002:adf:b342:: with SMTP id k2mr8775447wrd.264.1613735083454; 
 Fri, 19 Feb 2021 03:44:43 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm11528304wmj.6.2021.02.19.03.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:44:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] hw/boards: Introduce 'kvm_supported' field to MachineClass
Date: Fri, 19 Feb 2021 12:44:23 +0100
Message-Id: <20210219114428.1936109-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zA5uRYIguPJH

Introduce the 'kvm_supported' field to express whether
a machine supports KVM acceleration or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 68d3d10f6b0..0959aa743ee 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -129,6 +129,8 @@ typedef struct {
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities
  *    (which can't be negative), or -1 on error.
+ * @kvm_supported:
+ *    true if '-enable-kvm' option is supported and false otherwise.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @smp_parse:
@@ -209,6 +211,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
+    bool kvm_supported;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
-- 
2.26.2


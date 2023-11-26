Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp633877ejt;
        Sun, 26 Nov 2023 15:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNgai9OdnohdORWypTgtOtj6K3AeLWjgYLkSMzR46eBJeXWvVH4nq25yP8oqoviKhhgH7s
X-Received: by 2002:a05:620a:1a9a:b0:774:e4e:34d with SMTP id bl26-20020a05620a1a9a00b007740e4e034dmr14681824qkb.33.1701040376056;
        Sun, 26 Nov 2023 15:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701040376; cv=none;
        d=google.com; s=arc-20160816;
        b=aqJPzvo7PbSJj3cdQ8AnmghaLqRi37Vo1GTos2H6PNFZ/ADthDz2VeD0zKjGr86X7W
         uNiUdMyWNQy/HKAT2+RTi5fe5jVJLDzN6b+refPo7rDrev362i7RqdZoxzWKlt+gsRu8
         RwP2hUy9TMcxqs9KxnMWY/jtdFguODeW3dLUHJO4ORQwQ2UwGH2/boSResNU3N73eaTu
         e+AYDbqRHoqS6GSgKFsXnIyoHu9zVA70ID/zH/ZCq/fj+EDOO2ge0GgWuErO68d+dezj
         A2aGfusfuq10JiDDLoNzXKNIX7fGXmcRbeXdkuoQNyeCkeD/42lEKtEvjB6RtAXFF5k3
         3Mpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=fkwaEM58UHLuhpJyBeL28b0kI59lMSIVxOuuRaVK8LQ=;
        fh=j+indnOjTt+RINOBLao7PfkDc9cNRlB5CyY3wo1fnnU=;
        b=IUF6T2dUn8JDJzEj08xWOsUhkVz0jvtIK8wCRdDYVULeJ1AAAy9bnf0IZhGgdEFllw
         UyllLoOZETGct+ePzf2t7618rOCalaDTX4pQ8v/KmpL/pr3MgikbAKzOsMPWmYXwAQ9n
         euizVsjwaU8M4mBpe7RJbZWHMDqG1TURGaEhnpumEgSaP0U1X1tLCBhEHXJsyauCR8sk
         ESBPpZ/T86NZo6oIs4gCmY31lW7OGcnaet8RpgCWBB+33b4SAHYPlWhDzfxV82bLnMhM
         Ky3Bfa/IstN3GZhzuxWAeQsgywRFSp/G9a6QnqMLIyIVym3QfG3zm2VmAoQTD+5qFS89
         eisw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4RkQWak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d29-20020a05620a205d00b0077a1e808a68si7770984qka.767.2023.11.26.15.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G4RkQWak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OIk-0001T8-Pu; Sun, 26 Nov 2023 18:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OIj-0001SG-IA
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OIg-0005yk-Rl
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701040349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fkwaEM58UHLuhpJyBeL28b0kI59lMSIVxOuuRaVK8LQ=;
 b=G4RkQWak6ui3M8UxRJP9b2qeA7zn6/qaOWK4Ob4ftICgSeycc7KnsQm1bzUA9dEMcbVa+l
 9YnIeZ1A2Mc1MtDlRzytRZ1syzdzRX0HFaLsZes2hIxCe2qi4v9eTli+Aak8vo/zZ6NWsi
 fReZX5G6TNxBKKt3hKmiFI051/JvIpM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-tj7e-V6JODGPzbzB3Utbdw-1; Sun, 26 Nov 2023 18:12:25 -0500
X-MC-Unique: tj7e-V6JODGPzbzB3Utbdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46823811E7B;
 Sun, 26 Nov 2023 23:12:24 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6307E492BE9;
 Sun, 26 Nov 2023 23:12:15 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 shan.gavin@gmail.com
Subject: [PATCH v7 0/8] Unified CPU type check
Date: Mon, 27 Nov 2023 09:12:02 +1000
Message-ID: <20231126231210.112820-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Ia88v5i+DhUW

This series bases on Phil's repository because the prepatory commits
have been queued to the branch.

  https://gitlab.com/philmd/qemu.git (branch: cpus-next)

There are two places where the user specified CPU type is checked to see
if it's supported or allowed by the board: machine_run_board_init() and
mc->init(). We don't have to maintain two duplicate sets of logic. This
series intends to move the check to machine_run_board_init() so that we
have unified CPU type check.

PATCH[1-3] refactors the logic to validate CPU type in machine_run_board_init()
PATCH[4-8] validates the CPU type in machine_run_board_init() for the
           individual boards

v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html
v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00005.html
v5: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00611.html
v6: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html

Testing
=======

Before the series is applied:

  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu cortex-a53
  qemu-system-aarch64: sbsa-ref: CPU type cortex-a53-arm-cpu not supported
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu sa1100
  qemu-system-aarch64: sbsa-ref: CPU type sa1100-arm-cpu not supported
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu host
  qemu-system-aarch64: unable to find CPU model 'host'

After the series is applied:

  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: Invalid CPU type: cortex-a8
  The valid types are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,     \
                       cortex-a72, cortex-a76, cortex-a710, a64fx,        \
                       neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53, \
                       cortex-a57, max
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu cortex-a53
  qemu-system-aarch64: Invalid CPU type: cortex-a53
  The valid types are: cortex-a57, cortex-a72, neoverse-n1, neoverse-v1,  \
                       neoverse-n2, max
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu sa1100
  qemu-system-aarch64: Invalid CPU type: sa1100
  The valid types are: cortex-a57, cortex-a72, neoverse-n1, neoverse-v1,  \
                       neoverse-n2, max
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu host
  qemu-system-aarch64: unable to find CPU model 'host'

Changelog
=========
v7:
  * Add 'return' after error_propagate() in machine_run_board_init()
    to avoid calling mc->init() in the failing case              (Marcin)
v6:
  * Drop PATCH[v5 01-23], queued by Phil                         (Phil)
  * Clearer hint if only one CPU type is supported and have
    'const MachineState *' in is_cpu_type_supported()            (Phil)
  * Move valid_cpu_types[] to board's class_init() function      (Phil)
v5:
  * PATCH[v5 01] to remove CPU class 'ev67' for alpha            (Ricard/Igor)
  * PATCH[v5 02] to remove object_class_is_abstract() for hppa   (Gavin)
  * Don't move cpu_class_by_name()                               (Richard)
  * PATCH[v5 04] to remove 'oc == NULL' since the check has
    been covered in object_class_dynamic_cast()                  (Igor)
  * Introduce generic cpu_list(), shared by most of the targets  (Richard)
  * Use g_str_has_suffix and g_auto_free                         (Richard)
  * Collect r-bs from Igor and Richard                           (Gavin)
v4:
  * Integrate Philippe's patches where cpu_class_by_name()
    is consolidated and my duplicate code is dropped            (Philippe)
  * Simplified changelog and improvements                       (Thomas)
  * g_assert() on the return value from cpu_model_from_type()
    in is_cpu_type_supported()                                  (Philippe)
  * Collected r-bs from Philippe Mathieu-Daudé, Leif Lindholm,
    Bastian Koppelmann, Daniel Henrique Barboza, Cédric Le Goater,
    Gavin Shan                                                  (Gavin)
v3:
  * Generic helper cpu_model_from_type()                        (Igor)
  * Apply cpu_model_from_type() to the individual targets       (Igor)
  * Implement cpu_list() for the missed targets                 (Gavin)
  * Remove mc->valid_cpu_models                                 (Richard)
  * Separate patch to constify mc->validate_cpu_types           (Gavin)
v2:
  * Constify mc->valid_cpu_types                                (Richard)
  * Print the supported CPU models, instead of typenames        (Peter)
  * Misc improvements for the hleper to do the check            (Igor)
  * More patches to move the check                              (Marcin)

Gavin Shan (8):
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Print CPU model name instead of CPU type
  hw/arm/virt: Hide host CPU model for tcg
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

 hw/arm/bananapi_m2u.c   | 12 ++---
 hw/arm/cubieboard.c     | 12 ++---
 hw/arm/mps2-tz.c        | 26 ++++++++---
 hw/arm/mps2.c           | 26 ++++++++---
 hw/arm/msf2-som.c       | 12 ++---
 hw/arm/musca.c          | 12 +++--
 hw/arm/npcm7xx_boards.c | 12 +++--
 hw/arm/orangepi.c       | 12 ++---
 hw/arm/sbsa-ref.c       | 36 +++++----------
 hw/arm/virt.c           | 60 ++++++++++---------------
 hw/core/machine.c       | 98 +++++++++++++++++++++++++----------------
 hw/riscv/shakti_c.c     | 13 +++---
 12 files changed, 174 insertions(+), 157 deletions(-)

-- 
2.42.0


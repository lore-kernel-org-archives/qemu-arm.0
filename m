Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1015288ejf;
        Sun, 14 Aug 2022 23:31:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ffxdivVyJV9Qbm1CnN8Gui/stfhuKNGtGqaTD14Aszhw/VgWPisLBSVk4LaoqPLE4bwT4
X-Received: by 2002:ac8:5888:0:b0:343:6cf2:e185 with SMTP id t8-20020ac85888000000b003436cf2e185mr12462255qta.285.1660545099039;
        Sun, 14 Aug 2022 23:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660545099; cv=none;
        d=google.com; s=arc-20160816;
        b=rpns3kLmlv+uV08SJYzJ0iwcwElMWx70X94cuvvYfqZH08vTKL6N5fchM3HNCcXcPd
         i3u2owIZ3euYuRU2mjeZ2l9rDWrxkA1UEoLWzOBeV6D8y19T1c97S+6XGNgFGEs1o5ly
         RZnviEU19LIvox2qrdQqmQRc3G963RIFV//774VJd9t32fVtrjFUz98hKxJP8Lz4mzci
         Dsfl52LunZZST309oUehShG+0CVwFXC+LfPuf7zRGwUb+ufbkC3LT6HxsPd4tmShi3Wv
         Q5UlYxNl3Qs73rHDJRTs9Re+RCfpjVsfE4FZ89YainMjvOCFkJNqxSeqrBf7VwHcRztR
         4PTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=t//RPkk8qsPy8JgZVz6T9NGR3ElCqof5zdv/H95KjT0=;
        b=IRWh13sg0nklsPsT89oBlvOKpEXqc8NpEyJdKrnw3KweJAZvTRE2VqWOY0UfoawN5K
         ayLcCerfxRfmVrzYjw8JU22fJ7oaIwr1u4TpbU4SmViKbn4lO2HN0g6FiA5uXbLYZLmA
         iMPcnaAcPs0coqkO+rr1eIY2a31arK2oSHqndFc/TYeEFQLPSTW/KwGHYam141dm48v5
         x0WNm337vdaKhU7hGch2pwFnhmN8VoSvLYdz2dTOJhLrQvUyglUNMQGBMpoNAAqTcexH
         ff6q5Fzz8CIct3tsEQD+xPYX3QT2czWtCMNkqbI8Oll1fMDOIeI6Eq7oto03YP1KJbzl
         UaxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATT2M27J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020ae9f119000000b006b61dfb8644si4359214qkg.130.2022.08.14.23.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Aug 2022 23:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ATT2M27J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNTdS-0000uA-EP
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 02:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcO-0000t7-Nu
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcI-0000RC-Fe
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660545025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t//RPkk8qsPy8JgZVz6T9NGR3ElCqof5zdv/H95KjT0=;
 b=ATT2M27JEsZY8C/qrviyy+6QF6HPK3+as4CfA3ofFNEm7dkYTnfgVwxdYiCnKAPEiv8CNh
 6k4dPwwkJcSPB6aLaRHdEdnlpd2+3VxAKzuwB1pPAZGd7vJ7Ghv9RhVtVa7e1slClKrO0A
 xDIqRXqd4PKPbEHgFmzaXX6PkiuROp0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-anSrCpKSP0W1--1WrVo10Q-1; Mon, 15 Aug 2022 02:30:20 -0400
X-MC-Unique: anSrCpKSP0W1--1WrVo10Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBECD8037AF;
 Mon, 15 Aug 2022 06:30:19 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 968622026D64;
 Mon, 15 Aug 2022 06:30:16 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v2 0/4] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Mon, 15 Aug 2022 14:29:54 +0800
Message-Id: <20220815062958.100366-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zqA4PiTgMpcn

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.
    
(1) One specific high memory region is disabled by developer by
    toggling vms->highmem_{redists, ecam, mmio}.
    
(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.
    
(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.
    
(4) One specific high memory region is disabled when it breaks the
    PA space limit.
    
The current implementation of virt_set_memmap() isn't comprehensive
because the space for one specific high memory region is always
reserved from the PA space for case (1), (2) and (3). In the code,
'base' and 'vms->highest_gpa' are always increased for those three
cases. It's unnecessary since the assigned space of the disabled
high memory region won't be used afterwards.

The series intends to improve the address assignment for these
high memory regions:

PATCH[1] and PATCH[2] are cleanup and preparatory works.
PATCH[3] improves address assignment for these high memory regions
PATCH[4] moves the address assignment logic into standalone helper

History
=======
v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html

Changelog
=========
v2:
  * Split the patches for easier review                        (Gavin)
  * Improved changelog                                         (Marc)
  * Use 'bool fits' in virt_set_high_memmap()                  (Eric)


Gavin Shan (4):
  hw/arm/virt: Rename variable size to region_size in virt_set_memmap()
  hw/arm/virt: Introduce variable region_base in virt_set_memmap()
  hw/arm/virt: Improve address assignment for high memory regions
  virt/hw/virt: Add virt_set_high_memmap() helper

 hw/arm/virt.c | 84 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 34 deletions(-)

-- 
2.23.0


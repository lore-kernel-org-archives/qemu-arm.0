Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCF7CDB479
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Jun 2026 11:04:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbytt-0006iL-U1; Tue, 23 Jun 2026 07:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbyta-0006dd-PY
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 07:02:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbytW-00066H-Fz
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 07:02:21 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NAsFVc2218882
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 11:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VTGkAAqPBzGluCPiab/B5v
 MxXekWkb9qKi/y3skYJ+E=; b=hfD5MwmRrq5FuO7EEDoa+gFf4MHU5e6FHygclk
 rIf4TqPN/taFTpGXW8H8i1/MQABYFm7A8XceCRuuVEACMFvxqhozyJDXAXOfBF0V
 prhxV948cmfRoGqfUas613wUDeQDaLjlsHELr6tmjrD0V8NegovO7EVZyvG6Iokq
 VAloAK29uPN3GKxc78LhE0y+E5Gk2wOwyat7Ob3AEXO80hK6tDb87TA+SiuWdHKG
 xyaPvA27IRFAOn825xuFZK4HKScKgvB9wiOqR8agy8kfmQyjpxvE3z/8ZW2XcyJf
 nghbi/vsKu/tvIBvyuusmVSeyqkzIWoYWAGX+xhDkEBkH0aQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1grt59-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 11:02:16 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7e92c443b82so5756031a34.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782212535; x=1782817335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VTGkAAqPBzGluCPiab/B5vMxXekWkb9qKi/y3skYJ+E=;
 b=BUxpwoQnUJUzLke1Ob//3VlVC/MqVU/LJ5W2TCZRNzgFMR3YlGmznt1Kj04m8qysG7
 U2nDaszmgHJcUb2T/173CHK6JRduHsAZ795yoYiCQ2Hi1Emyn6SlcX3TE/dF7mrb5Oir
 zfvAGxR0GSYaF19oJQI16y4VEF1+VIO34DA7IJ0cdDH/8CJJGX5wEXASuA0AerYBig7S
 gOAFe8LFeOsL6OH5whDapC6ZCm+PiCOYCg2E7P04OA8dDPTqePmYnTuudZ1hxJ1jJmSq
 xcbsXvBJOaVWQPbBzSILWXsoXMaGvbsjYA2omojb3PbzR3qOkrBjpsJIbFV1I6tkHf5y
 RaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782212535; x=1782817335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTGkAAqPBzGluCPiab/B5vMxXekWkb9qKi/y3skYJ+E=;
 b=c+JykaooB6k0A2VCin/P5BG15aCk439BpdIKRZfqUO8gyS/mTu5QKqmkAXiuurweGS
 uAcXQn8RvT5OWKyW6Srb0y0sqnBjuaj2eas3ZtlBfaKKRaY5qnb1oJo7YvpGBab5mq/r
 Si1+7QEdoBydyy9t1joNbIVy5jtzreS74VUiNQcveT5gJ2UWHB+BK5PdM95h10FVl8P+
 pts8ES8Zpr6OsWyZ00K31eY21OIaJdzygDUvsb5ilyzqBRHxJHkVqs/YQcRg5nKNXFnM
 +Uip2C+T/1dxRSAS1zdZun4c+nZUW+MhjrPR+FpnOtE9EZEl1vpl2wxm0TCgI5jX2+zy
 Nodw==
X-Gm-Message-State: AOJu0YweMSKxVIaWd2/bBmpmnra++N5zr4sys8yKEfKVBl4gJhVApgb/
 wtdISMgTBZKC6Iu2XqUqHCkZFsSD3VVFB0+M4METt472U3sOUQB9y2sMZE8rIgN4YHqSUN8xkK4
 7cZCw1M6AFemUc5fDacWJCpSvlCM/H/soHyT1UU6UuT+fZzjqWEB7uU8=
X-Gm-Gg: AfdE7ckTxSac5ohwGzyxkYLEch7NBhhIaFSwm/XK+26GphU1ivvlGgFk7yqN5U6+ECC
 oAVJdb2g4dbE3qVXuDzx6oeXD7y2QRPyIxp48+Fkc97P8EdL6ukiSQ2DbxYXbMKpRfjAvdcQRz/
 QFtw57rAYz6lxNGzF0DZEJXLxpPRaXXYIF0Z1zuXonaOhHsS/Xd+2C14Kxq5TO46BsqOwlGtMoj
 fZB1XDmsJMDaAutgdy18RTvXGxRf0Wi2rkBDtC8ogSdM71CUbpcz3wUltmC1x5hYGdEV28aP7MS
 gnDPXJgi58VPzHImyVaSuIxF098TM6LWYmuMfvwu+3f1zUHjDAgXtdTzmiVndiXP+urOHk7qcZH
 JDYj/fk8zUq4l81ZOCQjn+pb8wDPZ0OVvQti7/Q==
X-Received: by 2002:a05:6830:6d05:b0:7dc:d587:af3 with SMTP id
 46e09a7af769-7e97998fc31mr1514667a34.23.1782212535479; 
 Tue, 23 Jun 2026 04:02:15 -0700 (PDT)
X-Received: by 2002:a05:6830:6d05:b0:7dc:d587:af3 with SMTP id
 46e09a7af769-7e97998fc31mr1514610a34.23.1782212535002; 
 Tue, 23 Jun 2026 04:02:15 -0700 (PDT)
Received: from localhost.localdomain ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5ddbsm36315212f8f.12.2026.06.23.04.02.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jun 2026 04:02:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [RFC PATCH v2 0/4] target/tcg: Rename some helpers common to various
 targets
Date: Tue, 23 Jun 2026 13:02:04 +0200
Message-ID: <20260623110209.26861-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mMtExrpo4okyUW5yghFaFK5OY1PwnuTn
X-Proofpoint-GUID: mMtExrpo4okyUW5yghFaFK5OY1PwnuTn
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a67b8 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gCilnUSdiZWjTjviJ0MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX2GiFIrLDEFHc
 CXGxo2g7bO2zPf+PL8p4Cbs/XoZuFPSJ/E1CwJ5b8Q+8snXHlXUq4TaaFn5WQ2sjJcnqUdqulLK
 vykw0JqD1C1IvvUyCcHs6ccD43dFKSY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX/JxOLAORtWKk
 qWITa8hMA9njoI0c46iWuwEsiSzE/CrCflE+LurSZJCEOo6/Uq7UL3kvqx6S/sp5l7ts8qQlKzI
 NscUtHaF2zlSXQd3DVf7KsyHJrBjrbiTDNu9RbKzjsQTekgBsCbrUjkvtCrJO7Ot3SINvADh7zt
 tlk62wWfACh1uoNDdMVFSMx7x+UZ72VMCunfze0BTS4mTjy0tim7J9gKJXaqlCJr2akvyQEQGnl
 +DUtRGvHPnWjA2qbnEvbdsuRvQ4nDMSWkJf8lwpw6UfIKDUP46phlxidiqDlYv5yk9m2oqHY6wj
 FZgsIq9lzzP4Ye7hWZV52F0xTnE4Qr21LoM6TA2axDKuswAYiGTHT3vbP8UDMJNYw1O1CsATFQb
 205tO6nLKtV6soK5wEXzWdwNwKe8s+ESsHUNErnTmagl+ZqaC6JxD+Ij9DMaLrJoBiei2ICSeXP
 8X2geEniUeBMgHdKp4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

TCG helpers are declared using the DEF_HELPER*() macros
which imply global symbol scope. Unfortunately when building
a single binary (containing multiple TCG 'target' frontends)
these symbols clash.

This series takes the dumbest approach, renaming the symbols.

There are still around 20 symbol clashes (usually FPU helpers),
but this series is good for my proof-of-concept.

Since v1:
- rebased on b0df6e2f2c6c45df8d4d286933799c623e124d98
  (Merge tag 'pull-riscv-to-apply-20260616')

Philippe Mathieu-Daudé (4):
  target/tcg: Rename bitswap() helpers
  target/tcg: Rename crc32*() helpers
  target/tcg: Rename raise_exception() helpers
  target/tcg: Rename set_rounding_mode() helpers

 target/arm/tcg/helper-defs.h                     |  4 ++--
 target/hexagon/gen_tcg.h                         |  2 +-
 target/hexagon/helper.h                          |  2 +-
 target/i386/helper.h                             |  2 +-
 target/i386/ops_sse.h                            |  2 +-
 target/loongarch/tcg/helper.h                    |  8 ++++----
 target/m68k/helper.h                             |  2 +-
 target/microblaze/helper.h                       |  2 +-
 target/mips/helper.h                             |  6 +++---
 target/ppc/helper.h                              |  2 +-
 target/riscv/helper.h                            |  2 +-
 target/sparc/helper.h                            |  2 +-
 target/i386/tcg/ops_sse_header.h.inc             |  2 +-
 target/arm/tcg/arith_helper.c                    |  4 ++--
 target/arm/tcg/translate.c                       |  4 ++--
 target/hexagon/op_helper.c                       |  2 +-
 target/hexagon/translate.c                       |  2 +-
 target/i386/tcg/excp_helper.c                    |  2 +-
 target/i386/tcg/translate.c                      |  2 +-
 target/loongarch/tcg/fpu_helper.c                |  2 +-
 target/loongarch/tcg/op_helper.c                 |  6 +++---
 target/m68k/op_helper.c                          |  2 +-
 target/m68k/translate.c                          |  2 +-
 target/microblaze/op_helper.c                    |  2 +-
 target/microblaze/translate.c                    |  2 +-
 target/mips/tcg/op_helper.c                      |  6 +++---
 target/mips/tcg/translate.c                      |  6 +++---
 target/ppc/tcg-excp_helper.c                     |  2 +-
 target/ppc/translate.c                           |  6 +++---
 target/riscv/fpu_helper.c                        |  2 +-
 target/riscv/translate.c                         |  2 +-
 target/sparc/helper.c                            |  2 +-
 target/sparc/translate.c                         |  6 +++---
 target/i386/tcg/emit.c.inc                       |  2 +-
 target/loongarch/tcg/insn_trans/trans_bit.c.inc  |  4 ++--
 .../loongarch/tcg/insn_trans/trans_extra.c.inc   | 16 ++++++++--------
 target/loongarch/tcg/insn_trans/trans_fmov.c.inc |  2 +-
 37 files changed, 63 insertions(+), 63 deletions(-)

-- 
2.53.0



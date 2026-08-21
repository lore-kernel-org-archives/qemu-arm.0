Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECF6C5DF81
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 01:39:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxEDy-0003Ni-AO; Thu, 20 Aug 2026 21:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeuk20.kim@gmail.com>)
 id 1wxEDw-0003Lr-Js
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 21:39:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jeuk20.kim@gmail.com>)
 id 1wxEDv-0002F0-63
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 21:39:12 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38511175ad3so433275a91.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 18:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787276349; x=1787881149; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:subject
 :content-transfer-encoding:content-type:mime-version:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XfNtGnk/NXATgtXqNnh1LpuC8UG3TYcVBjKNZq160rM=;
 b=mDPZDWLt8FmhJorgzekwuT4Gr+trIVZscAA6QPbsPQDhF6DQ8B8SnlvGeZfHpqUgBh
 i4HSZcskG6ayIE6WLQG23J8hRtmlq/23xQOcTg6iGNtWvugELluyRxFNXVD6detwMs+v
 qkTbHHhUe8PvNTIEdwuyXp0m9QnlwLmLLzeDP9BiNnDXf1IqPHrd8Y4kcfOnu4q/L+no
 rWgaZSr6E/LG/9NO7lraW6ONVE/tCyPxHBopcwwokCXghmnBmepRQurGV7B/sgw6saNu
 lhNquHzVsfSYP6kuh42LrDaRZosec6fnqf7zVG4yKbriCt4hJjAAVMn5jxPPcpcXg1va
 diTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787276349; x=1787881149;
 h=message-id:date:references:in-reply-to:cc:to:subject
 :content-transfer-encoding:content-type:mime-version:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XfNtGnk/NXATgtXqNnh1LpuC8UG3TYcVBjKNZq160rM=;
 b=Vb3jrmA62DxUrYB5cpb4+8d8sGIeyluV0KDt1oLc+tuBr2lX/3V4Ra6cqWFLYPkWJ+
 3z8jpFyhsIPSyH2VbMarWflO6m4KTH3sA0l7Ood9RANPhUZblGmd5IbwJ+RV10ql64mi
 Og67jk5v/HVI4gRono3xc9grbspinwvfKno/hpaAc5+/6Zofcv4qUWUib3+um2zQ1sWn
 5/71FuSRDElOdSJJpAEtSGyRZEmB8kkCNQMfRPDDjoxO8G3xCBHlOirYLofbeV4dbs+i
 gFHOm3vYJzTIhwhYbuXYb4hD/hyWB91Eew3HwN30xhDASahKZcabdkspeZz0rRn9rrJ+
 CD8Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoUWHLulagOSSX7Euv8EeE6DBdyEs+mZlYuMDvj/CXhWZin+Kt8wiMHu0P5Cl07DgWU+9JF28MG1w==@nongnu.org
X-Gm-Message-State: AFuF++ltmh6qUo88pb5QOJ6k2w187wHXheq1Gt55V/Zcgxl9sM6I9NyP
 KoLwGbRgjXAevnIlNjE/qejbOGZM2c0LLmexaAE9zey2/471AlmBGyLj
X-Gm-Gg: AR+sD10pJL+PSFkXSysy2VyJ5398y8hXCzdOeWYbu78K0xfziwjZvpb+gYV/WjJKBxN
 SiKF1kUMf8mwFrk30324sGhV6ZAeUp3WQPeF2YIlQcH/6p8/wWNkqBZISlILczeIyeOlERE6OCy
 jbUo64Iv5jD1sbcktXs82SsmUqxtIdUPPih0LjLI91ffQxv+u+LIJoifYBt0xQtqvvyofX38abC
 qKVZdM5E1T7earxApq+cDbgFT2fgGf841wIrle7UjjlwbIYoehF4CeCz2w6FTVIV7Vs/8xzhRYK
 Ed4AUVdwYeoTa5vvMz2UHZfHG/+Kaqpl3V7o38q4OZe0QECP6UJoqa1hyOlS44YG3f5EQekJ6r/
 rO+HFg7iH/lud3PrhVpuGZrUZdP0S1m/GGVg/giCytlgc/eRSK1DHRdTAvTcQH16W5MjcJRDoLd
 pncbfcCkLAXaCT3bzvEq/HQvtvNH/RRmOl0ZNH/aAeKQZW5jMO5QA9O7068IbQ9C52
X-Received: by 2002:a17:90b:4a81:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-395c34fed98mr4132889a91.4.1787276348966; 
 Thu, 20 Aug 2026 18:39:08 -0700 (PDT)
Received: from [127.0.1.1] ([211.226.54.223]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4be666bsm981873a91.11.2026.08.20.18.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 18:39:08 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
X-Google-Original-From: Jeuk Kim <jeuk20.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 5/7] ufs: Make the logical block size configurable
 and answer absent LUNs
To: Mikail Sadic <mikail.sadic@ibm.com>
Cc: clg@kaod.org, peter.maydell@linaro.org, pbonzini@redhat.com, 
 ninad@linux.ibm.com, titusr@google.com, jeuk20.kim@samsung.com, 
 philmd@mailo.com, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, kane_chen@aspeedtech.com, 
 andrew@codeconstruct.com.au, joel@jms.id.au, calebs@linux.ibm.com, 
 milesg@linux.ibm.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 j-young.choi@samsung.com
In-Reply-To: <20260813193040.669533-6-mikail.sadic@ibm.com>
References: <20260813193040.669533-1-mikail.sadic@ibm.com>
 <20260813193040.669533-6-mikail.sadic@ibm.com>
Date: Fri, 21 Aug 2026 10:38:44 +0900
Message-Id: <178727632471.917875.11234291271056551201.b4-review@b4>
X-Mailer: b4 0.15.2
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=jeuk20.kim@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 13 Aug 2026 14:30:37 -0500, Mikail Sadic <mikail.sadic@ibm.com> wrote:
> Two things the ufs-lu model hardcodes that hardware does not.
> 
> The logical block size is fixed at UFS_BLOCK_SIZE (4096), both in the unit
> descriptor the logical unit reports and in the block size of the scsi-hd
> backing it. UFS does not require that: the unit descriptor carries a
> base-2 exponent, and 512-byte blocks are common on real hardware and in
> images built for it. Add a 'logical-block-size' property that sets both,

In UFS 4.1, bLogicalBlockSize has a minimum value of 0x0c (4 KiB), and
READ CAPACITY explicitly states that the minimum logical block length
for UFS is 4096 bytes.

Do we have an example of real UFS hardware exposing 512-byte logical
blocks?

-- 
Jeuk Kim <jeuk20.kim@samsung.com>


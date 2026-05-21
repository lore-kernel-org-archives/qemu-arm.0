Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7DCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:23:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4JA-0001Sd-Cl; Thu, 21 May 2026 10:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ4IW-0001IF-VP
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ4IT-00058f-Nu
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779373368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RH05gHQfsO6XxElUEre8MjkhjJLcn3LTyidfBnh+DVI=;
 b=JrKzdZ38uxXvNIYxJbNy+VUuyunvefVwFkc/z3q/uoNkKERk/VX/NlbXfJCoZA6ixmf4zi
 TUKYjQiYXYePiSTswvF7Ws56vDrB9oA/ebFj2ewarEKbEkxNQ7nz1U+qNX1ScNtB+VmvFP
 8gLYCaSsMk8Thc3CQmc2oxHu9omqXuk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-sgrRMYMsP6uldDEpRi-YAQ-1; Thu, 21 May 2026 10:22:41 -0400
X-MC-Unique: sgrRMYMsP6uldDEpRi-YAQ-1
X-Mimecast-MFC-AGG-ID: sgrRMYMsP6uldDEpRi-YAQ_1779373360
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4411a2c034fso5700557f8f.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779373360; x=1779978160;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RH05gHQfsO6XxElUEre8MjkhjJLcn3LTyidfBnh+DVI=;
 b=WsBLaOFS3K2zuM0iHF6s4XDHO2szE6gM36TmMwID4BPfmGY9Rte0O4zYx18TfGfzw/
 c92UoIOQSXH97Y8+yW+YLG13RDV+Gra6l76SbwSvk2LOZ2QVry4stsDyLvjOlyJwiBs2
 knQM1tZxdoK4sZHak3DTwBxp/83vgPUUeGMYfc7+D4y/X6CO6D0yNtQEjDonCII4HvtZ
 VnCV0naLzLy21EmHdsFqgfiSkYl8O0trCkVkuOrfE87Rc08C+1fX/4kgCyx3n5XjpHgY
 TeXV1QZZWuMfjEwkraMYBspeVGYVsChzvZBSY5KuBFY0PvsxMVTRtbL3R6nuwMxID5xb
 vV5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ84K5GZtgCKwtI6sUo2QbbcvAMOR0SfHism/g1lb37bZR1HI/vc0KJ8B5ud8lFQOECmG0xdrw3iyg==@nongnu.org
X-Gm-Message-State: AOJu0YwSkuWr7VH4U/cGji6T0iVwG5xH9BhuZYBEi08lRhrAvoIK7zn2
 3j1+JHpIwi8uZMi1OeUQZONNm3FVbWPc+vUK/qXPgfYAzmxvJKMBvOEQlTk9NQPQP8IiJGE/0pV
 DcfthzIVFLuocH4txzhYH4HHdsPBlkFbKTsrbzLxqlbmLL29Vr0LYlw==
X-Gm-Gg: Acq92OF/SulPlT1Xhj4cAYwlluDeJNmUdQ9WJXAHx9RBFMX3164frqejskkPZmQjQ1l
 LNHUS5DkvVfPGjaFBi5gCGc/kyskC6ZFwIWRqMUU4XgBX7r7+uNAIseeyoPJs3lF/DB7LfzjCDg
 1wUN+Q1vWFxtKMFuPbxp780FUePplhaBWwO4TVt8bbn7nk4UxbP6wx9yGV2221PB1TCDw/bdkfe
 RPcFHYW68Nf7s0nSeL5b8Sazp1/Az+vf3Oo6wlH2ilawyLUPzdHhvXV/uhWbngwp6nqIeEnsHhs
 jeuQIQ6H8h5LwJRkUxnLfGWmuDlbXtPFbVlKV11zDy9pcA6pce3aSKzKENaCoypoDQwj7MW1Awl
 3ZVQOJ4xhmg1gjRBRcHEPKArXYE0unuX2xojK2C4RVA1bEsT+Z0WbNkUBdCi+qlINw3O3tQ0=
X-Received: by 2002:a05:600c:1c0d:b0:48f:fe2a:107b with SMTP id
 5b1f17b1804b1-49036048699mr56077865e9.7.1779373360393; 
 Thu, 21 May 2026 07:22:40 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0d:b0:48f:fe2a:107b with SMTP id
 5b1f17b1804b1-49036048699mr56077065e9.7.1779373359969; 
 Thu, 21 May 2026 07:22:39 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d44705sm63687105e9.4.2026.05.21.07.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 07:22:39 -0700 (PDT)
Date: Thu, 21 May 2026 16:22:38 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 11/18] arm/kvm: Initialize all writable ID registers
 from host
In-Reply-To: <20260519132905.145643-12-eric.auger@redhat.com>
Message-ID: <f049616f-d221-5f0e-95a5-e40d61637e0e@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-12-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x1w67j7K53dzyWQ9JHxzYoABBUKs_STAOPnvkMxFsG8_1779373360
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 19 May 2026, Eric Auger wrote:
> We want to allow overwriting writable fields of some ID registers.
> However currently some of them are never touched, neither read nor
> w. Examples are CLIDR_EL1, CTR_EL0, REVIDR_EL1, MIDR_EL1.
>
> We want to initialize them from the host value, allow overwrite
> and write back for kvm afterwards. This patch implements the
> initialization.
>
> Introduce a new get_host_cpu_idregs() helper that gets the host
> values for all writable ID regs and store them in isar.idregs[].
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D01CD5BD5
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 06:30:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wS7mB-0007Aw-Mv; Wed, 27 May 2026 02:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wS7m6-00078w-BA
 for qemu-arm@nongnu.org; Wed, 27 May 2026 02:29:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wS7m4-0007uv-R8
 for qemu-arm@nongnu.org; Wed, 27 May 2026 02:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779863391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JExJPPFLzVkYK23Ymb0qqNKDhD/YOhK6O4Mtx8xPHYI=;
 b=BaLa9vk4jQyNeL+nmBYor/ufcnVUNg2KY6IYsuyXvIcvKLp8PvmtG5AxdlnBK5eqr7Txfk
 PXtirUNeZPXoAIlANx4SDJmmw/57ycTUDgDvi0q1dj0BkSj/wUR6nQHvNn9SZJHPR8QleT
 Worqy7pKTYDwGXRW6e7qCp8nOM6JdXU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-boxP-hxcM6694k6w-AfzzA-1; Wed, 27 May 2026 02:29:47 -0400
X-MC-Unique: boxP-hxcM6694k6w-AfzzA-1
X-Mimecast-MFC-AGG-ID: boxP-hxcM6694k6w-AfzzA_1779863386
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-44f1b4d0fb0so7002349f8f.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 23:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779863386; x=1780468186;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JExJPPFLzVkYK23Ymb0qqNKDhD/YOhK6O4Mtx8xPHYI=;
 b=eF5L/LpV5wLflTH8NSHSSJBGeSLEqdM2DAsjnlXxNO997msYgn4AwQV1vyjLOwvDsv
 iiENaWzvd36FGUtYypE4npoLQzh1yMWseTG98tXxeEJ+tpmOfHnW7vVqV2uxmmQh/grV
 mGLOPaySuj5Kp9hX3I80IHQ6rYgj7Y5qRyO23jsY3IkTVcJTvc0I49An5+e3qwSN3U5W
 i5aLoC0Rkg1uX6NKuIS83Pped3F/bya+6IHvSIdfJ0oVXafRQAKhkWg/IY4QWC6Y/vU+
 B04ZkGJToSagg1f/zZiFOi+ll38LvVSZUP21TMoAz4MWjIEIYpW8qthzZxGzVbeZV05u
 WKOA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JiAS8fa2v/dBRYiv98MDrtok0ivUBOI1Gq2TgiDik7LESNOPjk39f+8O6eOgtFJ678WVcXM6wZg==@nongnu.org
X-Gm-Message-State: AOJu0YxgdheHF4BamZSd2mfLXW1K4qbPozMl4LSSs3m4webFKkcL4BYX
 6C7OuQpxGyjSJg96vnO/ExBDAdz9hvsuY5J0x087JYVYVjmDTwsegIRQa9zbQ1Cvhce/56dw3bd
 CoffEsFu2LlfdHGb91243jOe1iTuCgAbc9IROzlY+I+zP0szAONP1WQ==
X-Gm-Gg: Acq92OF8OPbHrPqn1ehORP6AjXQKKZR5GHgVWmbMWAn5aOHVSt0UqF85C1++J82kphW
 f6kPtWB2wTfoTOL7BaavDkJvEYP7MAcHqFpkotWM5OtpQN+pLjWVnq6QfHQuPbrS4qq5y6IJabq
 f61n3sTBJCnVnZzWm+Chs6HV3kCnAdVt5Jl5heU2cvRvVBcnDfinYTkwaYEz5ugbLMrsF4ouo67
 IlAVXzVV/90jB2Im9+yMSD+z1MV220XOybOZZ9xVopRUR9P3FxBp33PG9tCHmeUr8Kxymj40TNF
 /LepJPlTCHi8et6O7CIaNqms6oV4JDfCQBuNZrrrj9v5jhtWwpyzCuNk31OLGO52pOEfJWr8Ia3
 Vq9X+w78NPgRfenKALU6U+WhrRBsRlIpUqyczKNZ5sRWfh/VKMUskerOwjGBV0yRy0btVQ8o=
X-Received: by 2002:a05:6000:1447:b0:452:d03a:7abe with SMTP id
 ffacd0b85a97d-45eb38b91c3mr38816075f8f.17.1779863386135; 
 Tue, 26 May 2026 23:29:46 -0700 (PDT)
X-Received: by 2002:a05:6000:1447:b0:452:d03a:7abe with SMTP id
 ffacd0b85a97d-45eb38b91c3mr38816017f8f.17.1779863385730; 
 Tue, 26 May 2026 23:29:45 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb54959bsm4149286f8f.1.2026.05.26.23.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 23:29:45 -0700 (PDT)
Date: Wed, 27 May 2026 08:29:44 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 skolothumtho@nvidia.com, philmd@linaro.org, maz@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, armbru@redhat.com, 
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Subject: Re: [PATCH v5 17/18] arm-qmp-cmds: introspection for ID register props
In-Reply-To: <20260519132905.145643-18-eric.auger@redhat.com>
Message-ID: <10ae56f5-6fc7-fe58-1e17-7c3b968045be@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-18-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gq5JxSpQ_F1HGEukq124XgOmLP2_Zoebg8vV3m5wmtg_1779863386
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> From: Cornelia Huck <cohuck@redhat.com>
>
> Implement the capability to query available ID register values by
> adding SYSREG_* options and values to the cpu model expansion for the
> host model, if available.
>
> Excerpt:
> (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
> {"return": {"model": {"name": "host", "props":
> {"SYSREG_ID_AA64PFR0_EL1_EL3": 1224979098931106066,
 				 ^
This looks wrong - more like the full reg value and not just EL3..

> "SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0,
> ../..
>
> So this allows the upper stack to detect available writable ID
> regs and the "host passthrough model" values.
>
> [CH: moved SYSREG_* values to host model]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>



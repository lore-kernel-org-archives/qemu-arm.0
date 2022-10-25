Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3982951ejn;
        Tue, 25 Oct 2022 03:32:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7R/n6Fy4VkWfzBe+krrvPl9osOCYdmR5AcdJlO2g07fHvVDmtJy1Tvd6WHTntpI1QSkfI+
X-Received: by 2002:a0c:e352:0:b0:4bb:825d:a803 with SMTP id a18-20020a0ce352000000b004bb825da803mr4900776qvm.9.1666693931197;
        Tue, 25 Oct 2022 03:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666693931; cv=none;
        d=google.com; s=arc-20160816;
        b=bgwlS86fxEfpS6kt2dbPamObYEjXvRLGixg5+gRUcOnHPMtRe0aMO2IEtR/WeW37Iz
         PwQdOnyHSFSQLWszEuhZjlzBKPmr4ronS+ClKBFYOXWku+hYKjvQmGlmsfxMOjkc1rxK
         CizOQ+ydrlOuKlgkmbt4Za8gfLJ0H5UI+6fNzETWLjyx87Tpnmm/cY5wV7M7v7dvOY/o
         vsOuS3+ZaWIVndpM6fauHlh7+5sd6QAdz8+ONYDRaxSgRG9G3z4vqYsQZTQMZarfuXSa
         r/VD4LWDNnF0w++7hnxehAiKQV3ZqQ/Ed4oLhnDtfUCHrDwlroh9ERYcy/z5YEJnJnID
         KVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=34bxmZJ8Te0DlkWAXV5zPc9nvq5gDe/mlESQQwuecQM=;
        b=PF0In9hznh31joM83Tz+EinJhV26G6DNiJ5WpAIov74hnCf94QSg8D4edcSLTDdg8u
         IDy4n2R59PYuOmpq8jcWBv6bqR00/0Fhzs1eFNmFcU0GKhDmu6J7ZcdmUJ1uYmm7keKg
         H0V2PifmO2HdUkC/gCFu92gXz+7ednZ+TgSlF9Vy0JAbEzZ41DKdfcmF7O48bCto9Zqh
         98y5QEebZpIye6VJH10vW38I9KjL97WxDqQjVFJ+hoNxECnZ7z/j32NWGJQV7auqApag
         DwbHUQZnRCaUOVnhttgPdhtY8sYjoYWDzVCVn5vvCSy9xQxvKfWjk3nKdGW+UR1ua4Z5
         6qOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cHGV7Izo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020ac85458000000b003a4460af074si450447qtq.233.2022.10.25.03.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 03:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cHGV7Izo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onHDq-0007Mm-5R; Tue, 25 Oct 2022 06:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1onHDB-0003q5-5r
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1onHD4-0001JS-77
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666693861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34bxmZJ8Te0DlkWAXV5zPc9nvq5gDe/mlESQQwuecQM=;
 b=cHGV7IzoO4+/TthCYL1jYK4sf8KqNKzxOLNNcYfiim5EfUcTyivrbu6pfnkg7aCSK7KBq6
 6XNmWd87jrRSL0hK5+PwzAL00j1xHqHlCCcrL0DeIpkTuDfDxaRILfc3qd3yU0/ZN3ZebO
 0wqgQu0pIkyWaFmui/coY8rA5F44F0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-pho-LKNYMT2SsZCSVukDMQ-1; Tue, 25 Oct 2022 06:30:58 -0400
X-MC-Unique: pho-LKNYMT2SsZCSVukDMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47547185A7A9;
 Tue, 25 Oct 2022 10:30:57 +0000 (UTC)
Received: from localhost (unknown [10.39.193.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E115810197;
 Tue, 25 Oct 2022 10:30:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v6 6/7] hw/arm/virt: Add 'compact-highmem' property
In-Reply-To: <20221024035416.34068-7-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-7-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 25 Oct 2022 12:30:55 +0200
Message-ID: <877d0ofb4w.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +lccVKHDC8ef

On Mon, Oct 24 2022, Gavin Shan <gshan@redhat.com> wrote:

> After the improvement to high memory region address assignment is
> applied, the memory layout can be changed, introducing possible
> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
> is disabled or enabled when the optimization is applied or not, with
> the following configuration. The configuration is only achievable by
> modifying the source code until more properties are added to allow
> users selectively disable those high memory regions.
>
>   pa_bits              = 40;
>   vms->highmem_redists = false;
>   vms->highmem_ecam    = false;
>   vms->highmem_mmio    = true;
>
>   # qemu-system-aarch64 -accel kvm -cpu host    \
>     -machine virt-7.2,compact-highmem={on, off} \
>     -m 4G,maxmem=511G -monitor stdio
>
>   Region             compact-highmem=off         compact-highmem=on
>   ----------------------------------------------------------------
>   MEM                [1GB         512GB]        [1GB         512GB]
>   HIGH_GIC_REDISTS2  [512GB       512GB+64MB]   [disabled]
>   HIGH_PCIE_ECAM     [512GB+256MB 512GB+512MB]  [disabled]
>   HIGH_PCIE_MMIO     [disabled]                 [512GB       1TB]
>
> In order to keep backwords compatibility, we need to disable the
> optimization on machine, which is virt-7.1 or ealier than it. It
> means the optimization is enabled by default from virt-7.2. Besides,
> 'compact-highmem' property is added so that the optimization can be
> explicitly enabled or disabled on all machine types by users.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  docs/system/arm/virt.rst |  4 ++++
>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h    |  1 +
>  3 files changed, 37 insertions(+)
>

(...)

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4896f600b4..11b5685432 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -174,6 +174,12 @@ static const MemMapEntry base_memmap[] = {
>   * Note the extended_memmap is sized so that it eventually also includes the
>   * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
>   * index of base_memmap).
> + *
> + * The memory map for these Highmem IO Regions can be in legacy or compact
> + * layout, depending on 'compact-highmem' property. With legacy layout, the
> + * PA space for one specific region is always reserved, even the region has

s/even/even if/

> + * been disabled or doesn't fit into the PA space. However, the PA space for
> + * the region won't be reserved in these circumstances with compact layout.
>   */
>  static MemMapEntry extended_memmap[] = {
>      /* Additional 64 MB redist region (can contain up to 512 redistributors) */


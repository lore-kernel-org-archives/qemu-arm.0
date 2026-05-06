Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D1AFF8855
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 12:50:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKbhD-0004cH-MR; Wed, 06 May 2026 08:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKbhC-0004c8-JA
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wKbhA-0006du-Lc
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778071783;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKK+8xeHmWK8j0e8XBFbmARtqKIf5WMBbUeUSi3fkLI=;
 b=ByIAg2NHrvbtkQ4bjaU3uyd5E1LuCfA0/brDZ/BnunLDC8m0+2b4jyuwicO704uAkRdLuF
 q9RXhh66MpcdgiNN5U/uof9a5XzGHKmQhAGodEe3scR4+ecllSJ+usEVKjkbFX6siPP4NF
 jXqoo1H4ltWuv9vaUzUN4WsvZdI8GAE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-SUrFa1BaNvaUqYpUk53fDw-1; Wed, 06 May 2026 08:49:42 -0400
X-MC-Unique: SUrFa1BaNvaUqYpUk53fDw-1
X-Mimecast-MFC-AGG-ID: SUrFa1BaNvaUqYpUk53fDw_1778071781
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48a589c7879so6556445e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 05:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778071781; x=1778676581;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKK+8xeHmWK8j0e8XBFbmARtqKIf5WMBbUeUSi3fkLI=;
 b=IVwE7sW/dbgjcJ90IsvRDaFkuY33Xivj/hG29pDDLkZ2hojyujGFo2SZfAEz2VQAei
 DQFVz6dhgTwd15pII1aSqBouWpIdbUH6ht6G6Jdt5BVgbpAUYrUBnqiv2zI3utqLtMeH
 l7fBPhAZqzqXHwvsYYvy206DF/C2dm2fXjqnrMhlNIXhZpWux7ceERZHRkzo8o++jLdP
 8OIK8HWZDjFccm2RE9nyo2cqjTk01f04y4VMfQ8ZG9lOrvw94nW9ayAE2h0watUF78ob
 SBUQdiVKjOgHJksBzUjsbikUKA+m7wU5W3wYV+2ZBhmg7TZW5p/I6oL6fl75rNoFKNxo
 WAiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+WCsz7uDuZO41C93f7hsiJ3XAzLh6/6ww+QqINq2UjFIRPJTc4bXxK80jNBBb6JWYiH9jzevV4Qw==@nongnu.org
X-Gm-Message-State: AOJu0YxHcV1UmduWJXRE7XSOaHGtNcslV98GQFR0B2gW9Rgiq8Fn4+33
 blbFqVkmgs54xHo2iYr3eo4TxgvsqT9lQIEMvhaGIntdilTTx942EqnQHrOUO0NAldsXghen8nm
 ZTYOpkJ6uM23VBIxOcwZEDt0vLsjPV5wehNbXHbeGUxZOFEGUPqieudFqEe1zog==
X-Gm-Gg: AeBDievVmY1XpdXJQ3dSZFxsNcpi2MT7GI0IjP1upVz/NtAEiT2+33cUUg/GodDsI2j
 B4bhMELC3Otonlicvd/vp1dc13al0lNiUEA9K3uk1O52sK6KU05DrGp/t1T/D4zoVWDyjHQDP0C
 TQkPNOCB+bFVFcEN1Su1d3i0nbQngKdT3rjBHvZtV5saTmu3nBXD6WfgDKwtQAU5IwmySFfBh68
 0fxl9qoJ5m+OJDkxM95/htIwFGENnE0Xtna4gOly939lCf85JZoCNawlMOlC3Y7S9lHOmn7st7X
 MX0CCB7R/bjWEClj6pCeveOFMQqhnJu05p8XQWTCS1RWTD1FXhbERRiPpvuByMWhc33s1AI2dET
 BukyF3tNwijxBbn5K5ams6kNyu8tMySQjHv08q4qVoI1yFU4WiqldNOylftLOSVE4A5cxuY+cIw
 eKgi91
X-Received: by 2002:a05:600c:8908:b0:48d:50a:6ef4 with SMTP id
 5b1f17b1804b1-48e522b8577mr32425655e9.11.1778071781009; 
 Wed, 06 May 2026 05:49:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8908:b0:48d:50a:6ef4 with SMTP id
 5b1f17b1804b1-48e522b8577mr32425375e9.11.1778071780630; 
 Wed, 06 May 2026 05:49:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e59b74277sm8141125e9.3.2026.05.06.05.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 05:49:40 -0700 (PDT)
Message-ID: <123b3178-8fb9-495f-b4f7-9af40f7a1a99@redhat.com>
Date: Wed, 6 May 2026 14:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/31] hw/arm/smmuv3-accel: Introduce common helper for
 veventq read
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-24-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-24-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0mSbsnLVJkkCog0odfO-Z1WSN6YMV16HAQNrI8y1JSs_1778071781
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> Move the vEVENTQ read and validation logic into a common helper
> smmuv3_accel_event_read_validate(). The helper performs the read(),
> checks for overflow and short reads, validates the sequence number,
> and updates the sequence state.
>
> This helper can be reused for Tegra241 CMDQV vEVENTQ support in a
> subsequent patch.
>
> Error handling is slightly adjusted: instead of reporting errors
> directly in the read handler, the helper now returns errors via
> Error **. Sequence gaps are reported as warnings.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-accel.h       |  2 ++
>  hw/arm/smmuv3-accel-stubs.c | 11 ++++++
>  hw/arm/smmuv3-accel.c       | 67 ++++++++++++++++++++++---------------
>  3 files changed, 53 insertions(+), 27 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 28bceca061..448f47c0ca 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -71,6 +71,8 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice *sdev,
>                                  Error **errp);
>  void smmuv3_accel_idr_override(SMMUv3State *s);
>  bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp);
> +bool smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
> +                                      void *buf, size_t size, Error **errp);
>  void smmuv3_accel_reset(SMMUv3State *s);
>  
>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
> diff --git a/hw/arm/smmuv3-accel-stubs.c b/hw/arm/smmuv3-accel-stubs.c
> index c08caa6fa4..e8f08dc833 100644
> --- a/hw/arm/smmuv3-accel-stubs.c
> +++ b/hw/arm/smmuv3-accel-stubs.c
> @@ -41,6 +41,17 @@ void smmuv3_accel_idr_override(SMMUv3State *s)
>  {
>  }
>  
> +bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
> +{
> +    return true;
> +}
> +
> +bool smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
> +                                      void *buf, size_t size, Error **errp)
> +{
> +    return true;
> +}
> +
>  void smmuv3_accel_reset(SMMUv3State *s)
>  {
>  }
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 9068e65e2b..230f608f03 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -436,47 +436,60 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd, SMMUDevice *sdev,
>                     sizeof(Cmd), &entry_num, cmd, errp);
>  }
>  
> -static void smmuv3_accel_event_read(void *opaque)
> +bool smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
> +                                      void *buf, size_t size, Error **errp)
>  {
> -    SMMUv3State *s = opaque;
> -    IOMMUFDVeventq *veventq = s->s_accel->veventq;
> -    struct {
> -        struct iommufd_vevent_header hdr;
> -        struct iommu_vevent_arm_smmuv3 vevent;
> -    } buf;
> -    enum iommu_veventq_type type = IOMMU_VEVENTQ_TYPE_ARM_SMMUV3;
> -    uint32_t id = veventq->veventq_id;
>      uint32_t last_seq = veventq->last_event_seq;
> +    uint32_t id = veventq->veventq_id;
> +    struct iommufd_vevent_header *hdr;
>      ssize_t bytes;
>  
> -    bytes = read(veventq->veventq_fd, &buf, sizeof(buf));
> +    bytes = read(veventq->veventq_fd, buf, size);
>      if (bytes <= 0) {
>          if (errno == EAGAIN || errno == EINTR) {
> -            return;
> +            return true;
>          }
> -        error_report_once("vEVENTQ(type %u id %u): read failed (%m)", type, id);
> -        return;
> +        error_setg(errp, "vEVENTQ(type %u id %u): read failed (%m)", type, id);
> +        return false;
>      }
> -
> -    if (bytes == sizeof(buf.hdr) &&
> -        (buf.hdr.flags & IOMMU_VEVENTQ_FLAG_LOST_EVENTS)) {
> -        error_report_once("vEVENTQ(type %u id %u): overflowed", type, id);
> +    hdr = (struct iommufd_vevent_header *)buf;
> +    if (bytes == sizeof(*hdr) &&
> +        (hdr->flags & IOMMU_VEVENTQ_FLAG_LOST_EVENTS)) {
> +        error_setg(errp, "vEVENTQ(type %u id %u): overflowed", type, id);
>          veventq->event_start = false;
> -        return;
> +        return false;
>      }
> -    if (bytes < sizeof(buf)) {
> -        error_report_once("vEVENTQ(type %u id %u): short read(%zd/%zd bytes)",
> -                          type, id, bytes, sizeof(buf));
> -        return;
> +    if (bytes < size) {
> +        error_setg(errp, "vEVENTQ(type %u id %u): short read(%zd/%zd bytes)",
> +                          type, id, bytes, size);
> +        return false;
>      }
> -
>      /* Check sequence in hdr for lost events if any */
> -    if (veventq->event_start && (buf.hdr.sequence - last_seq != 1)) {
> -        error_report_once("vEVENTQ(type %u id %u): lost %u event(s)",
> -                          type, id, buf.hdr.sequence - last_seq - 1);
> +    if (veventq->event_start && (hdr->sequence - last_seq != 1)) {
> +        warn_report("vEVENTQ(type %u id %u): lost %u event(s)",
> +                    type, id, hdr->sequence - last_seq - 1);
>      }
> -    veventq->last_event_seq = buf.hdr.sequence;
> +    veventq->last_event_seq = hdr->sequence;
>      veventq->event_start = true;
> +    return true;
> +}
> +
> +static void smmuv3_accel_event_read(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +    IOMMUFDVeventq *veventq = s->s_accel->veventq;
> +    struct {
> +        struct iommufd_vevent_header hdr;
> +        struct iommu_vevent_arm_smmuv3 vevent;
> +    } buf;
> +    Error *local_err = NULL;
> +
> +    if (!smmuv3_accel_event_read_validate(veventq,
> +                                          IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &buf,
> +                                          sizeof(buf), &local_err)) {
> +        warn_report_err_once(local_err);
> +        return;
> +    }
>      smmuv3_propagate_event(s, (Evt *)&buf.vevent);
>  }
>  



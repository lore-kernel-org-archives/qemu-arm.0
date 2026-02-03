Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB2AE87850
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 17:32:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnKGX-0003Yr-R5; Tue, 03 Feb 2026 12:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vnKGC-0003U2-3D
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 12:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vnKG6-0007T4-2s
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 12:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770139929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nV1QEexHhULTt9lndN8UjP2uphSwtHjKv3xbuHKA1OU=;
 b=R94BWuFYNy60bURXlU28sgmniv3Lpy2dz2RfO8AFr5LtJ3GMq8NN+L3Ym+AgEqtTq6wOb6
 UVS1lLiMtNSWP1+R2px4EXOZmpfVycL0tRWJIx4ly/xcsk7iatRE2kGuG2iOnQXj53qNhB
 6p5UuM0AwMOdI3vvUklN8JUb5rO7P7o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-3P4extfFP8-po83UjBuW6Q-1; Tue, 03 Feb 2026 12:32:07 -0500
X-MC-Unique: 3P4extfFP8-po83UjBuW6Q-1
X-Mimecast-MFC-AGG-ID: 3P4extfFP8-po83UjBuW6Q_1770139927
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4830e7c6131so2541505e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 09:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770139926; x=1770744726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nV1QEexHhULTt9lndN8UjP2uphSwtHjKv3xbuHKA1OU=;
 b=BqZrejHiUMmlOktabUig8cowccdWSOgtXc6E78YzBY3fc0Kmc1YERlKCinHNGoOsK+
 OGU0Wqnk4Cc2tBIGxp8Xe3ye9fvkqmBb4Lc94rLYlFYZ+78YKfGOszvg1OrQbFsxjLHi
 fevnT8q+FsCPsGWPksZu/K6XHXBwsM2L2ll3KonQdZjcSulfLnJnWpLQxzVrGZPH8Wio
 I4sCLK6eLRBC79HpwnUNLvbNGVJor+wNj1U8DbJ5+QwGpCPAMExqOgk4N/ZSUEp/jRpL
 4/NhZzhB31x2XjqoMZL1rVvJgDG60Uy9slyDqcBhZb6bU3fTX2mEYfscF+S2UNKz09el
 R/Kg==
X-Gm-Message-State: AOJu0Yyjg+AKwX8G+nWDm5IL8VqvGWa5XW6JOEZ5DFR/O/iHfqnrYOV1
 EsC9onpkRfiHwPgWSbj06gqOwz4hH+W0F4rcyTUAdQwpbnQqTWH0Z6/Q89RSO56duC7VDyUz6TU
 lt6khigT4+G+QB0v6uNGUalduzEKkDjuHXYE5AQg6/EKtPkMN/OW+RQ==
X-Gm-Gg: AZuq6aI1zqab1lJ+8D/plDIHwC+wx+lHHwrXOBI7GxpxpS9bAC1To/mnzGCzcsrPB2I
 sjC3A9DWom09Xw29bJV6HM3Od0vMke2N/W3cjpcwdY94iHDCFmZiSQi0YLGWpcGjkVSe04bpQgq
 ztIIR47yjZxCj5B6et7TaMZdOxRs7G/+HRrGF6WovbyzCcQemSWVQwv1vbQwthAOqKXd8PAFj5v
 1cpHDp662fu1FzuTNWnvi2kD/bYx+/mEmeA931fGeB3m/m47jBeCMFTgQmBxA1SYED8YKiJrqaB
 JfvX+ipkGPYyZG7q+e/9AAN7vhITFyQ6dWSl+XatKcgsUSxC9u+MFDFNtmqSmvba9BW2zjQair9
 zUJvEgIQGe5RUUUzX6Cw8JvEE77QYsl455Q==
X-Received: by 2002:a05:600c:3e0d:b0:46e:59bd:f7d3 with SMTP id
 5b1f17b1804b1-4830e96fb0cmr5089335e9.20.1770139926323; 
 Tue, 03 Feb 2026 09:32:06 -0800 (PST)
X-Received: by 2002:a05:600c:3e0d:b0:46e:59bd:f7d3 with SMTP id
 5b1f17b1804b1-4830e96fb0cmr5088945e9.20.1770139925795; 
 Tue, 03 Feb 2026 09:32:05 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830515381esm80484405e9.11.2026.02.03.09.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 09:32:05 -0800 (PST)
Date: Tue, 3 Feb 2026 12:32:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 alex@shazbot.org, clg@redhat.com, cohuck@redhat.com,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com,
 jgg@nvidia.com, kjaju@nvidia.com, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 2/4] hw/net/virtio-net: Adapt hash handling to updated
 UAPI
Message-ID: <20260203123143-mutt-send-email-mst@kernel.org>
References: <20260113113754.1189-1-skolothumtho@nvidia.com>
 <20260113113754.1189-3-skolothumtho@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20260113113754.1189-3-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Y3yBrp-CoxHV238LMcG56gn1IdZ_xES3suY1gYH5VM_1770139927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Tue, Jan 13, 2026 at 11:37:52AM +0000, Shameer Kolothum wrote:
> The virtio_net_hdr_v1_hash layout changed in the Linux UAPI, replacing
> the 32-bit hash_value field with two 16-bit fields, hash_value_lo and
> hash_value_hi.
> 
> Update hash handling to populate the new fields correctly and adjust
> offset and size calculations accordingly.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>


Has to be squashed in patch 1 or bisect will be broken.

> ---
>  hw/net/virtio-net.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 317f1ad23b..512a7c02c9 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1879,7 +1879,8 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
>                                               n->rss_data.runtime_hash_types);
>      if (net_hash_type > NetPktRssIpV6UdpEx) {
>          if (n->rss_data.populate_hash) {
> -            hdr->hash_value = VIRTIO_NET_HASH_REPORT_NONE;
> +            hdr->hash_value_lo = VIRTIO_NET_HASH_REPORT_NONE;
> +            hdr->hash_value_hi = VIRTIO_NET_HASH_REPORT_NONE;
>              hdr->hash_report = 0;
>          }
>          return n->rss_data.redirect ? n->rss_data.default_queue : -1;
> @@ -1888,7 +1889,8 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
>      hash = net_rx_pkt_calc_rss_hash(pkt, net_hash_type, n->rss_data.key);
>  
>      if (n->rss_data.populate_hash) {
> -        hdr->hash_value = hash;
> +        hdr->hash_value_lo = cpu_to_le16(hash & 0xffff);
> +        hdr->hash_value_hi = cpu_to_le16((hash >> 16) & 0xffff);
>          hdr->hash_report = reports[net_hash_type];
>      }
>  
> @@ -1990,10 +1992,11 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>  
>              receive_header(n, sg, elem->in_num, buf, size);
>              if (n->rss_data.populate_hash) {
> -                offset = offsetof(typeof(extra_hdr), hash_value);
> +                offset = offsetof(typeof(extra_hdr), hash_value_lo);
>                  iov_from_buf(sg, elem->in_num, offset,
>                               (char *)&extra_hdr + offset,
> -                             sizeof(extra_hdr.hash_value) +
> +                             sizeof(extra_hdr.hash_value_lo) +
> +                             sizeof(extra_hdr.hash_value_hi) +
>                               sizeof(extra_hdr.hash_report));
>              }
>              offset = n->host_hdr_len;
> -- 
> 2.43.0



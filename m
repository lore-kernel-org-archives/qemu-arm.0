Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp155277lfp;
        Wed, 6 Oct 2021 03:35:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh3OLrTPUFnpVq86550NjtmGMY+aYVABBVB0mnUz+SxClZy40rONm/ra3mxcacHZ/lz24I
X-Received: by 2002:a67:d996:: with SMTP id u22mr12633694vsj.12.1633516557418;
        Wed, 06 Oct 2021 03:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633516557; cv=none;
        d=google.com; s=arc-20160816;
        b=Lmyw65Ai/X9I8QUHVOvtHZqIhM8nsonRyoxO3Nzdvme3M7VzZqabwsKYkTDwQgu/DX
         xGXh3SE9KxwnAc2rJeHGXm5ZVL6AJc9iHlIgGx7HKyiksM1TyKQGgZ34+zVfC141hwpp
         IvKs9zKv1oR8uU380BHG6kE1M+6LrLFVZRigT8vanoTV4OhgsUMilN9WY8V89khUlSd6
         fIY0jjnOLXgDQEC+SxMkeHCi0b5FjpRSgEl45MQF/LzS2kVEortTJiVI7axUXturnK/O
         mbRAQut/pihWEQqFB20GMhqNN1C7ng01BcLDpHX7vQ1ucDYgv4jcg4iAiASZ9NF0nVb3
         HjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Y5pqJzdkARgwv4cohbzyy4bCihjtZ11rk8/kzWU/ujk=;
        b=BXFWJZALn9AaFkolIwcqKBjA0nuTunxNC7hzehkcWZHe2f10Kwg2XZpt2VKCUGSlIA
         xrZz4422amW77iQmu/8g5QbUBsVDR3NMhnfz0UoGC9DST+E9XvCpcF1rCVmV4jkH0ZDb
         W8SQvGAnWt6yM0GeQF32MWlgds8rPhsvzsDZaKErHpm787d1oF0kyYGEFtgraW0BBhQV
         Hel4Jyq4PJUE7G0g3bvd53P+khkRBulD81OfJYN9/H7n2XoJjZWXDy8EaBJ3zNiMzUBO
         hzakVsrXZwozo2y30e2PtKLodIijaMfJ1GEv7+5N+udCyWcjKYo88omaVEeo4m5WsqY0
         PLGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LvaoblZd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q195si2743325vkq.99.2021.10.06.03.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 03:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LvaoblZd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY4HE-0007TB-JG
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 06:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY4H1-0007SS-5U
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 06:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mY4Gx-0005pL-UJ
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 06:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633516538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y5pqJzdkARgwv4cohbzyy4bCihjtZ11rk8/kzWU/ujk=;
 b=LvaoblZdt8XM60FBTrdKYqsbkyCnucTtp5qJGJ20o57YG3dxjcf3jrA7b7n9/DeKcbZ0//
 vcn/eamcuFxnhSNvux4DyZPo0iZfyoudZNHswp5NiQgDQGXt5jrMRnIw9TRhg7CvH4csPU
 PN9ODFtscGlu2bgk0NVwiOdqWWb/ORo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-TEAuwqaWPK-CLLTWaUaApQ-1; Wed, 06 Oct 2021 06:35:37 -0400
X-MC-Unique: TEAuwqaWPK-CLLTWaUaApQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so2209608edi.12
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 03:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y5pqJzdkARgwv4cohbzyy4bCihjtZ11rk8/kzWU/ujk=;
 b=oBYZhETzg4oP669f3D/PIs/lij6fNXg6w2lOMnGkFmce/SC0vKyKqVGH2ncepSnU6y
 qc7ngotv+zCqL2xnGDCRg8TzF42NWUwLM7haNUCFwqcU6BDAqOGr1WZagBSaOLcGNTm8
 t++R2MH+SrhkCeZ6XUpkYMQtmdu9FZMxDSN8cxjRPvsFvgtlqQ32y+UxVRaKvDAjd+X7
 zQHXqlmhHacr6p6AntaMVYIBaGG+k10cPsRiQA1cx34NXLtQ6ZtK+9QpaMjmydqyuUzI
 OlQKA2698L25CFIPwW0602+jyKcgii43lxIaAuN1O5dA5fy9f2DMrq89N4ijsmZN/rAB
 8s+Q==
X-Gm-Message-State: AOAM5309dYfzh5YxSmt7AdNHbhD7ejcAPEKew9MtuhYFLBoJPFMul2dd
 IPiQaeRUjpPe5vUaj7R/qgOt7L0K0iD9NrTuO4N2q64jTpg2b71qWPDZlaSDjQ+jqM563QusAoQ
 3PmOJCTygVzMK
X-Received: by 2002:a17:907:110b:: with SMTP id
 qu11mr30456069ejb.380.1633516536496; 
 Wed, 06 Oct 2021 03:35:36 -0700 (PDT)
X-Received: by 2002:a17:907:110b:: with SMTP id
 qu11mr30456037ejb.380.1633516536273; 
 Wed, 06 Oct 2021 03:35:36 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id a14sm514979eds.84.2021.10.06.03.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 03:35:35 -0700 (PDT)
Date: Wed, 6 Oct 2021 12:35:29 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211006103529.25vjtmkmijmomq4u@gator.home>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211006102209.6989-2-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gP0SKcTFEEKg

On Wed, Oct 06, 2021 at 06:22:08PM +0800, Gavin Shan wrote:
> The following option is used to specify the distance map. It's
> possible the option isn't provided by user. In this case, the
> distance map isn't populated and exposed to platform. On the
> other hand, the empty NUMA node, where no memory resides, is
> allowed on ARM64 virt platform. For these empty NUMA nodes,
> their corresponding device-tree nodes aren't populated, but
> their NUMA IDs should be included in the "/distance-map"
> device-tree node, so that kernel can probe them properly if
> device-tree is used.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> So when user doesn't specify distance map, we need to generate
> the default distance map, where the local and remote distances
> are 10 and 20 separately. This adds an extra parameter to the
> exiting complete_init_numa_distance() to generate the default
> distance map for this case.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/numa.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 510d096a88..fdb3a4aeca 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
>      }
>  }
>  
> -static void complete_init_numa_distance(MachineState *ms)
> +static void complete_init_numa_distance(MachineState *ms, bool is_default)
>  {
>      int src, dst;
>      NodeInfo *numa_info = ms->numa_state->nodes;
> @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
>              if (numa_info[src].distance[dst] == 0) {
>                  if (src == dst) {
>                      numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
> +                } else if (is_default) {
> +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
>                  } else {
>                      numa_info[src].distance[dst] = numa_info[dst].distance[src];
>                  }
> @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
>           * A->B != distance B->A, then that means the distance table is
>           * asymmetric. In this case, the distances for both directions
>           * of all node pairs are required.
> +         *
> +         * The default node pair distances, which are 10 and 20 for the
> +         * local and remote nodes separatly, are provided if user doesn't
> +         * specify any node pair distances.
>           */
>          if (ms->numa_state->have_numa_distance) {
>              /* Validate enough NUMA distance information was provided. */
>              validate_numa_distance(ms);
>  
>              /* Validation succeeded, now fill in any missing distances. */
> -            complete_init_numa_distance(ms);
> +            complete_init_numa_distance(ms, false);
> +        } else {
> +            complete_init_numa_distance(ms, true);
> +            ms->numa_state->have_numa_distance = true;
>          }
>      }
>  }
> -- 
> 2.23.0
>

With this patch we'll always generate a distance map when there's a numa
config now. Is there any reason a user would not want to do that? I.e.
should we still give the user the choice of presenting a distance map?
Also, does the addition of a distance map in DTs for compat machine types
matter?

Otherwise patch looks good to me.

Thanks,
drew


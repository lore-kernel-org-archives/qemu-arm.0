Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2266296lfb;
        Thu, 7 May 2020 12:41:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ687Afpzam6KE8IWUXuyvCqc+9cNSmrFbF++/yXTl9f80A8Wc0VlmoGo1cSk+4baaSsMmX
X-Received: by 2002:a37:a417:: with SMTP id n23mr15888379qke.480.1588880501009;
        Thu, 07 May 2020 12:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588880501; cv=none;
        d=google.com; s=arc-20160816;
        b=xibZ3heYueEG1vfmlnwxeQvP/NvJgAltUQDgmQJ18Xlev7FQo09pH+n41thYJu5BNh
         j4WRX31BVoNK9M6c/PJhuUbUN3aw9/viVRMSHgnjDQ2RrY5HDz6No1FrWo/NUu15ag2H
         af4onWPhE4fz50xP2SL/LPgQ/9OaA2W+4ua4Zp5L4yI8FvmiJkNFC1rKOCu3wxyHZkxr
         vWeQtm7TZtNBnPqCR80toGH8uLsamXn4vAO/bpj9g3G+sYhE+4dohcPQSfJ3dvCdgyXa
         5FlzFt7WLT3G4YcfTpT8oQfGfrRq2yuEpL719GFwbdMrPewK1SR9Y6xpZqFH6Z8Q1evo
         XgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=hofnAB2Re/dqo9fJcQcSEF2cwk3KUk1xyagOVNlVm5Q=;
        b=tSgKam3Ty1ujw2zNrJQ3F98qsYkF+bdKZCPCUTpofrWLE1CvlFxMAwZQqbQhkCBqog
         SoX+8Mn+Oi09Wgv9VepCmhstBNUmCFGmFhPTQcc1JenurW8mTmtDn8VC5B9CaWPqMYyp
         zQWA6nZ8CV57IVxlcClaAjg2HHbIQ3pVslEceg5vCLwVTQ3444ILBskyLfyQsKikqvGi
         7prZfuNu2ZBGEfKDOEa2GhDyQAtKH/wjbaWioM2WJbkcdWBR9G7PRB9oTmRzlM2gTZKY
         4Bv5RQHyW2JOvZSJdQxUU3lpksbGQWOb0uZo368qJ7qopOsdMRMTk1UUk3iUmjFbF1Mw
         s44w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Os+4MiAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id z3si3754920qkg.118.2020.05.07.12.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 12:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Os+4MiAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWmOq-0005YK-Fv
	for alex.bennee@linaro.org; Thu, 07 May 2020 15:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jWmNu-0004Mb-Uh
 for qemu-arm@nongnu.org; Thu, 07 May 2020 15:40:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50088
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jWmNu-0002Et-8b
 for qemu-arm@nongnu.org; Thu, 07 May 2020 15:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588880441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hofnAB2Re/dqo9fJcQcSEF2cwk3KUk1xyagOVNlVm5Q=;
 b=Os+4MiAN5hU/K4nH8xLJNVHRvSrWFjwQTeMSvvWUESq56ngJpp5gmARF/lTJLfzED5Zm6z
 8EspMz5rnhp0AFGEyTQamLZXaQPnGWQdvjQzN8s8YYBPLLHTdW0w4qi3ZhWIgKEW5frOX8
 QAz9j12I54TezgwnZa4p4qJrIp20Wt0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-lp2UZrkhPju-GdfV-papbQ-1; Thu, 07 May 2020 15:40:36 -0400
X-MC-Unique: lp2UZrkhPju-GdfV-papbQ-1
Received: by mail-qk1-f198.google.com with SMTP id d19so6886871qkj.21
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 12:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ncw8rl44dhQ7t9UFrlATFwoUE+F3BVWlDH/VwEe4u/k=;
 b=M6KgCN90cYoJU8lMrb65Xd8Ny3NuElTTyvGVImDtafTFhwzbHLI7o48IrHTfZlR/Oe
 TDQmFjAWWLPQ8h1lkQfEu8Bhs7WgD0htFEg6na8riDFSS18VlA4zFa7wwedBsq1HSCZ/
 dF+cFh6QRqFMN8YupznPuWOR4MLai9xQlwE978BI5YSSq42Hed0wXKrWiwuy1DuMihlF
 Gu3qGLXbHyzbd4qQAjEmzgKOtA3Iok3BDlGvT4e1Xsz7Wcmg39VpsM73XpBLFT1jqX1A
 JuCDss80hs87iOXdhNrgye4PSB2cUSFlsHmOwIitXsuYfzq1MUQ65t28TYodpqpeJyD2
 daPg==
X-Gm-Message-State: AGi0Pubn++r74d9mqPebNNARFDmP4sMbWf4kM5CPEpXHicJyX8VrIfyj
 r+QC8EoId331yAm0wSxJCnihBLp573lfNuro4icsKkTnDdkugSyewRSMsIhIH6nx98HUMCkxagt
 pS2fFLcQkrn+M
X-Received: by 2002:aed:3788:: with SMTP id j8mr15327796qtb.113.1588880435261; 
 Thu, 07 May 2020 12:40:35 -0700 (PDT)
X-Received: by 2002:aed:3788:: with SMTP id j8mr15327771qtb.113.1588880434999; 
 Thu, 07 May 2020 12:40:34 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id h13sm5108006qti.32.2020.05.07.12.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 12:40:34 -0700 (PDT)
Date: Thu, 7 May 2020 15:40:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/5] virtio-iommu: Implement RESV_MEM probe request
Message-ID: <20200507194032.GL228260@xz-x1>
References: <20200507143201.31080-1-eric.auger@redhat.com>
 <20200507143201.31080-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200507143201.31080-3-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=peterx@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:15:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ja8/EH2wEf/

Hi, Eric,

On Thu, May 07, 2020 at 04:31:58PM +0200, Eric Auger wrote:

[...]

> @@ -452,17 +520,33 @@ static void virtio_iommu_handle_command(VirtIODevic=
e *vdev, VirtQueue *vq)
>          case VIRTIO_IOMMU_T_UNMAP:
>              tail.status =3D virtio_iommu_handle_unmap(s, iov, iov_cnt);
>              break;
> +        case VIRTIO_IOMMU_T_PROBE:
> +        {
> +            struct virtio_iommu_req_tail *ptail;
> +            uint8_t *buf =3D g_malloc0(s->config.probe_size + sizeof(tai=
l));
> +
> +            ptail =3D (struct virtio_iommu_req_tail *)
> +                        (buf + s->config.probe_size);
> +            ptail->status =3D virtio_iommu_handle_probe(s, iov, iov_cnt,=
 buf);
> +
> +            sz =3D iov_from_buf(elem->in_sg, elem->in_num, 0,
> +                              buf, s->config.probe_size + sizeof(tail));
> +            g_free(buf);
> +            assert(sz =3D=3D s->config.probe_size + sizeof(tail));
> +            goto push;
> +        }
>          default:
>              tail.status =3D VIRTIO_IOMMU_S_UNSUPP;
>          }
> -        qemu_mutex_unlock(&s->mutex);
> =20
>  out:
>          sz =3D iov_from_buf(elem->in_sg, elem->in_num, 0,
>                            &tail, sizeof(tail));
>          assert(sz =3D=3D sizeof(tail));
> =20
> -        virtqueue_push(vq, elem, sizeof(tail));
> +push:
> +        qemu_mutex_unlock(&s->mutex);

I think we can't move this unlock to here because otherwise "goto out" coul=
d
potentially try to unlock it without locked first.  Thanks,

> +        virtqueue_push(vq, elem, sz);
>          virtio_notify(vdev, vq);
>          g_free(elem);
>      }

--=20
Peter Xu


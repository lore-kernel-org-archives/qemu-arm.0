Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp86047lfm;
        Thu, 16 Apr 2020 23:40:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwJndysCj7VS45QgIHmmLYAUDWuSHzVbqSI07OPYfJLvYeiHCC+xxzz3NEJBzpMIuTYxt/
X-Received: by 2002:a0c:9e68:: with SMTP id z40mr1274983qve.242.1587105603905;
        Thu, 16 Apr 2020 23:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587105603; cv=none;
        d=google.com; s=arc-20160816;
        b=n0Gg2HNP4/+MHGn3rBrpzcNCK5ITDafPj8uGgd+hqWFdlvJ60UG1zNa0xrjPdGlFMO
         Lcn08vYnpIENREdaAMc0yuMG3K+qmr9pSYgAuZVHZf3qJRUvGlhRvN2rVm/CoeRA+EFL
         nxDNFWM/RcHLFuPj8p2nRYNn1mZsog676M0jZat3NPlDPT21Dt2K6rnpnhyFsfqpvwTp
         OdDQ7QogqQL6RcpUVrDg6lSoOLnwkRo23/d65HCzn8nt1/XnpnpFVZa04q5E24oPK8ZC
         WghSAoAiW3hhtAWIaEjNZhXR4BkJFZ2QHiNMj2z5vgZGXmmVYPG5/tC4Tv1NzNlWNvp4
         h8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=MUBVQPBPFdM7O8Ue/0lkR4HtTtJFO9rT0lI5kG1dp6A=;
        b=K9Us56f6+ch+7Bjt4PePPPs0d2TTLvVsLUF9rDXqNYw0wi75ySwFvNqP4UpqiSocv6
         +GeThwRoLJbAfENGGxu5RiLXOiGzOgY8Ol2rGWhapWw7zGIcFy/e8JwEDrYOQmtH2rCg
         dLfjwliEL8tZH2fypBraTfcfx4AbHTuXjPFlPM9NuqnSN//UkiPnF6ZMEJUUk6sKWWIj
         qjYWjviAMIh+BMW3jwZQ6gI3R3jHZWeFgsbPr560G3Ct5y1LTw/56bayPczSjTU0xQpA
         OmtWWUV466EphedRKAhILB5RzPtBwMhMLoMLLOvuZ4CObHoNtpmffTsJ4v0cPxMlL38c
         L6DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VKGJpOFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si5024980qkd.247.2020.04.16.23.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 23:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VKGJpOFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPKfT-0006ES-Bf
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 02:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jPKfL-0006Dw-0i
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 02:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jPKfJ-00078I-F7
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 02:39:54 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46879
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jPKfJ-00077j-9Z
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 02:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587105592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUBVQPBPFdM7O8Ue/0lkR4HtTtJFO9rT0lI5kG1dp6A=;
 b=VKGJpOFGvnINIjspD3OjhoYmXR/V6zAPR1oRxQ8KSHfZfzRNEIoAbLDyYsygXPzGvfGggs
 K1mdUJ8d/6QtYycUdIqH8ReXhqOSDYDcVxYBD6JrchPJVl33fNbAg80asdEUYPcHXDiP6s
 S7edGn9+zGNAig86A8PRXo8/5XPz5uA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-zQ5miB0WNrynbJUMeYuoEw-1; Fri, 17 Apr 2020 02:39:50 -0400
X-MC-Unique: zQ5miB0WNrynbJUMeYuoEw-1
Received: by mail-wr1-f71.google.com with SMTP id j16so508488wrw.20
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 23:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s8pQoSM8B9SNpU47Rf2Vn7xWVBYdXT3UvqvSWwIi4Bk=;
 b=rmsETTHxkt8Sd30N11hUBj6HU6iqOuB9EyGQin7J2RiNvPGO+39yQppa5K9+7drnM3
 nqJ0AJNh8XkYZtCf3/4mKr76IiWQzOsGlYOj/r9e6lsETAmmAkMTkM7lRdCXl9P2Avq0
 yO2lG9YDC929xAveoZgYQnfjsjX1vgU2dN9Jc9LZAL/uKCWDRTcKaBjVTd2SZeTsG9fT
 IFnHZkhiOB8FKtyWVBzLPuHmpmIxzFLX22wtOOMXAdBQIMSdxLIdJA64WJY2qcOpiFMl
 AC+nJarZYRlArSbDzhBbTbc6odIimfEnVbyjyh7DAsY/cnF6Qv2VFo4JzIGnYid2VqFZ
 tu5w==
X-Gm-Message-State: AGi0PuaUYfXyPKAiKROj5ai1qaLuilGrEd2dUQQCbBwBWl+Pig2flVFx
 Eqi1e3DHH0LwnTF6j7mqpDzM7+wttMJWGtXIJiocOe2PuSkeR+vRg8JJSJA3Dyg6ZGQfwH4WzNq
 n+o7ng1GegDoT
X-Received: by 2002:a5d:4388:: with SMTP id i8mr2093444wrq.186.1587105589750; 
 Thu, 16 Apr 2020 23:39:49 -0700 (PDT)
X-Received: by 2002:a5d:4388:: with SMTP id i8mr2093409wrq.186.1587105589461; 
 Thu, 16 Apr 2020 23:39:49 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id m14sm28673674wrs.76.2020.04.16.23.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 23:39:48 -0700 (PDT)
Date: Fri, 17 Apr 2020 02:39:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 05/12] vhost-user-gpu: Release memory returned by
 vu_queue_pop() with free()
Message-ID: <20200417023937-mutt-send-email-mst@kernel.org>
References: <20200414133052.13712-1-philmd@redhat.com>
 <20200414133052.13712-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200414133052.13712-6-philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /HJ5qGk8u+gF

On Tue, Apr 14, 2020 at 03:30:45PM +0200, Philippe Mathieu-Daud=E9 wrote:
> vu_queue_pop() returns memory that must be freed with free().
>=20
> Cc: qemu-stable@nongnu.org
> Reported-by: Coverity (CID 1421887 ALLOC_FREE_MISMATCH)
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 4 ++--
>  contrib/vhost-user-gpu/virgl.c          | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user=
-gpu/vhost-user-gpu.c
> index b45d2019b4..a019d0a9ac 100644
> --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> @@ -848,7 +848,7 @@ vg_handle_ctrl(VuDev *dev, int qidx)
>              QTAILQ_INSERT_TAIL(&vg->fenceq, cmd, next);
>              vg->inflight++;
>          } else {
> -            g_free(cmd);
> +            free(cmd);
>          }
>      }
>  }
> @@ -939,7 +939,7 @@ vg_handle_cursor(VuDev *dev, int qidx)
>          }
>          vu_queue_push(dev, vq, elem, 0);
>          vu_queue_notify(dev, vq);
> -        g_free(elem);
> +        free(elem);
>      }
>  }
> =20
> diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virg=
l.c
> index 43413e29df..b0bc22c3c1 100644
> --- a/contrib/vhost-user-gpu/virgl.c
> +++ b/contrib/vhost-user-gpu/virgl.c
> @@ -519,7 +519,7 @@ virgl_write_fence(void *opaque, uint32_t fence)
>          g_debug("FENCE %" PRIu64, cmd->cmd_hdr.fence_id);
>          vg_ctrl_response_nodata(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
>          QTAILQ_REMOVE(&g->fenceq, cmd, next);
> -        g_free(cmd);
> +        free(cmd);
>          g->inflight--;
>      }
>  }
> --=20
> 2.21.1


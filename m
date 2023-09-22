Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1200326ejm;
        Fri, 22 Sep 2023 03:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQE6HdEgp1FvCAZNrcC2jhRrxxTdL8+dVt1BzRC2T6stvFDtEaeNh3tSLGwiAqoCp5vh+d
X-Received: by 2002:ac8:7f55:0:b0:405:381b:a81b with SMTP id g21-20020ac87f55000000b00405381ba81bmr8794808qtk.57.1695378212403;
        Fri, 22 Sep 2023 03:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695378212; cv=none;
        d=google.com; s=arc-20160816;
        b=rmUwUWoRrxkoAKv0bIWmnmP64OhxZ0TuA/PFmb9yEYBPj5PBPVxbN/xKBJb+D1aoRf
         aNoyTRmdqh8/6lHQc6Xun4hMWHDrAEORdAySyFI1iIyk6jSLuGifMx7LIfHqAlDwqo/G
         ILprqBh8u/W7zS+inXwMG3Y435QRVPI48yA8GT9SAQBoYxgZGa7a2Wl2c4wIKgnCgm1k
         UXzMkaSsbBPBie/wdNMZkXMtHUkYfrIyOMbxq15L9c9MIn1kpvSs4QGpBqHjgiPOzzgY
         a+5+6ozHODIP20J/ToExFT2FuBXyIp5XoV3dE1jfyB6xXXkO35boezCbR9MxbdRMPk7n
         UxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=MOpPYxL42GKs0jJm+ztk/5+3c6vMTjxmqEKKWtoWqqE=;
        fh=nerfE2lFWI+ezQRJ14Apc3p+ktneZp+FsXQe/58NQv4=;
        b=oOuthR27Ww/aSfAPBbuoQZgfQyM7M4gNKET1fN44bCJs6wPu/t2dCzNejQwUzBvRQh
         o5fqAfYAokZmZ/i1cedWyV3pYEDDZM0zX/kW1eqLPiIO62H1GINh5bh35YX4FZVw3pTQ
         s96liBePaK94L8seyInx34ApSjRD+E677CUKhSxlNd60hjIHaYkkFEp2zw+tC/lb0WdO
         1+3HA6fZJafjloUEgrugnijBSrgUj9UCKMjWfLY29oIo7J1djt8IG3P3+lPXGRua4PuP
         WyU+AQ2e1/2MtLRK0pUL9k8r+8RFmu/46gXGTPSGceAlRP8hLS0Li+eMd+DjYh1TeOKr
         F5vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pjos0H91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp31-20020a05622a1b9f00b004122ed9aa52si2030813qtb.131.2023.09.22.03.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 03:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pjos0H91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjdJp-0003ZH-Ol; Fri, 22 Sep 2023 06:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qjdJn-0003WQ-Ox
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:23:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qjdJm-0006Gc-C7
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695378205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOpPYxL42GKs0jJm+ztk/5+3c6vMTjxmqEKKWtoWqqE=;
 b=Pjos0H91EkPOtEOPzcUJuK3CUMfaBnJnIbh7ScATfAz9C7gunNNOdh7X6CguF7e8bhXH/k
 dTY3kYRrt+WViqm2FS+DzFatJMIDuUSnNCFTSX9epoyoai4RGhmS/CGi5fKGi8ltS9ji4X
 fVF76NmypZZKu9kyYv/MwBBX9o/xMr8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-ay9Rye46OdGIhL4EPeKrMQ-1; Fri, 22 Sep 2023 06:23:23 -0400
X-MC-Unique: ay9Rye46OdGIhL4EPeKrMQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ae12311183so156467966b.2
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 03:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695378202; x=1695983002;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MOpPYxL42GKs0jJm+ztk/5+3c6vMTjxmqEKKWtoWqqE=;
 b=fK3BtnfMUYC5lwqDNj+ajwRmbLWXIcF/4oAoqOYlNIgtONn6wBOnvZC0FVHvafgZ+a
 bvwCEcNxM3Dttb9FUB8HJsy/AdXC+J1DENp+mm515fDbRHbYGcxSQTdy7Mfx7Ykho2Mm
 cJy77ilt6+5yBnaJh7P0YDYq9zJtnCo4DSlhpYVfqVyGeKy5ql8OU5vgY3oQAxD+3QEW
 qVzibMY7KArwigt0rQTMY9LfsoXmyeuIUFYyk0QJzzzj8LAR88aS+/+yJqB14MWH0COf
 KFD5ORsyyYmOe5KgmWkoqo0iQ7dVBz0LlpCvEjyEe+4OKm4TWx9R+gs+5rv2SRB2XlPn
 rXgQ==
X-Gm-Message-State: AOJu0YwELZm+oq4D6wFrzlyabRAvZbBG2FnJpbtnXF0N0Co4n+inMb6W
 tIEOm1tGjhoenek46j/myciO6CePh5U6RzNybVhS6l2xuVxZDsBPwBt+MvaagZ+CjM4hsVF0GZE
 WvghnwGJw4T/s
X-Received: by 2002:a17:906:159:b0:9a1:f21e:cdff with SMTP id
 25-20020a170906015900b009a1f21ecdffmr8216733ejh.23.1695378202659; 
 Fri, 22 Sep 2023 03:23:22 -0700 (PDT)
X-Received: by 2002:a17:906:159:b0:9a1:f21e:cdff with SMTP id
 25-20020a170906015900b009a1f21ecdffmr8216717ejh.23.1695378202381; 
 Fri, 22 Sep 2023 03:23:22 -0700 (PDT)
Received: from redhat.com ([2.52.150.187]) by smtp.gmail.com with ESMTPSA id
 lv23-20020a170906bc9700b0099d798a6bb5sm2494904ejb.67.2023.09.22.03.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 03:23:21 -0700 (PDT)
Date: Fri, 22 Sep 2023 06:23:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>
Subject: Re: [PATCH v2 17/22] util/vhost-user-server: Clean up local variable
 shadowing
Message-ID: <20230922062306-mutt-send-email-mst@kernel.org>
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-18-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230904161235.84651-18-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uw6JDIvsoi9W

On Mon, Sep 04, 2023 at 06:12:29PM +0200, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>   util/vhost-user-server.c: In function ‘set_watch’:
>   util/vhost-user-server.c:274:20: warning: declaration of ‘vu_fd_watch’ shadows a previous local [-Wshadow=compatible-local]
>     274 |         VuFdWatch *vu_fd_watch = g_new0(VuFdWatch, 1);
>         |                    ^~~~~~~~~~~
>   util/vhost-user-server.c:271:16: note: shadowed declaration is here
>     271 |     VuFdWatch *vu_fd_watch = find_vu_fd_watch(server, fd);
>         |                ^~~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge.

> ---
>  util/vhost-user-server.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> index cd17fb5326..5073f775ed 100644
> --- a/util/vhost-user-server.c
> +++ b/util/vhost-user-server.c
> @@ -271,7 +271,7 @@ set_watch(VuDev *vu_dev, int fd, int vu_evt,
>      VuFdWatch *vu_fd_watch = find_vu_fd_watch(server, fd);
>  
>      if (!vu_fd_watch) {
> -        VuFdWatch *vu_fd_watch = g_new0(VuFdWatch, 1);
> +        vu_fd_watch = g_new0(VuFdWatch, 1);
>  
>          QTAILQ_INSERT_TAIL(&server->vu_fd_watches, vu_fd_watch, next);
>  
> -- 
> 2.41.0
> 
> 


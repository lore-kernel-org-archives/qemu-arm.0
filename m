Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp16656ejb;
        Tue, 25 Jul 2023 11:18:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGKBMr2o+HD7LU7xMBMW4ukNjXlyset+ENLJM6ZM7IgmZrYMFsMBvP1W7x4C1+JdEAAfg4x
X-Received: by 2002:a05:6830:608:b0:6b9:8357:61ba with SMTP id w8-20020a056830060800b006b9835761bamr155751oti.1.1690309099447;
        Tue, 25 Jul 2023 11:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690309099; cv=none;
        d=google.com; s=arc-20160816;
        b=VrpeJU57qGMat6XUik2WWmYPgGPfP6ZRWB4OgQizxd3AOw1kd/RfFWuQOUsZZiXdK/
         ++LkBDBASHsUNf3tZD8/HXjGj32umCotH5mD2CClw9faaITuchL/lq9balk+oguM4jYh
         Lf4IyyXNjEfKWdH53pt+lFO14lQ1aEYHp6Fw1hLlzR7+rNE9oPrWk5RUB6ASVWwdBO9p
         h4nARvE2RM8iqqKaOo6Bcmjf+RlPzxUP3pBxfj1Jyz9e2IUxz4zH3s8rAWdCR2JB0wzf
         BHNS0wh+l0bggMy8jdo8wTg3Y3wE7o8XiZJ70TFoeV9LG6aYx3lrC2pvF3RDdYoB/iaF
         qiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=QFeo4169o3VzOSsDIJ1PbH/jQWk3Py2Zqju87A1HEok=;
        fh=zLQERmDA5TGOuXtIamHC2vUF6ncw0A4+dsMvQHS1arc=;
        b=MwpPXICjdu1Dji5s+jZwB7Px5sLfVU3OWp+3TFcXulZsD8iJgNfb50H6rRHwoxyJh5
         ThamETIzrv4mYSUU0FHxLab4zaJCzA6O+s3siBkoI+j/8iopPlOdnJ5jyjZhlAQ6GEN8
         4Uir2rmB64bNne1qKG80dbAllkmc32uKA0ROydC3ifg/89yAFcKgU/AjHtfCVS0y8b4i
         9jPP03hurDybBsiVQwId6B4rSO+d3lW7ze+1XxFJNI8D4QdmvjVgy855xK53SIZ/v15u
         leaA7EU8uSyGizVXSab7qh9Xwf6cPp3E5HtbpAnupwjsQgCf0n+ZhqUz6jLVE9AbAXOL
         DRLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDbv7F3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05622a14cc00b004009e42b674si7114792qtx.317.2023.07.25.11.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDbv7F3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMbx-00059l-6D; Tue, 25 Jul 2023 14:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMbv-000596-Hs
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMbt-00043t-Vb
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690309093;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFeo4169o3VzOSsDIJ1PbH/jQWk3Py2Zqju87A1HEok=;
 b=bDbv7F3ZJ7SvslRXF8oJlRQX/AoBBvvA6cuCkJ1DQs3kivty7tsHuZng7vbxIV43TX4ksP
 Ip8PdD5O/I+HxR7G90nfYlq4u132kZjKIhiPlquo3EjTORM9d0TZuzU1CHOyJmqrmGJerx
 Qr2FRRl2MAa4bPEyp5AsWe4eQx9E56w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-GUGB1_q6PieE8B-WZa63Sg-1; Tue, 25 Jul 2023 14:18:09 -0400
X-MC-Unique: GUGB1_q6PieE8B-WZa63Sg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B44AE803FDC;
 Tue, 25 Jul 2023 18:18:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D3AC1121339;
 Tue, 25 Jul 2023 18:18:06 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:18:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/6] python/machine: close sock_pair in cleanup path
Message-ID: <ZMAR3L4O9sSEV4AL@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-3-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725180337.2937292-3-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xvdtqeyGnZwS

On Tue, Jul 25, 2023 at 02:03:33PM -0400, John Snow wrote:
> If everything has gone smoothly, we'll already have closed the socket we
> gave to the child during post_launch. The other half of the pair that we
> gave to the QMP connection should, likewise, be definitively closed by
> now.
> 
> However, in the cleanup path, it's possible we've created the socketpair
> but flubbed the launch and need to clean up resources. These resources
> *would* be handled by the garbage collector, but that can happen at
> unpredictable times. Nicer to just clean them up synchronously on the
> exit path, here.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 8be0f684fe..26f0fb8a81 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -395,6 +395,11 @@ def _post_shutdown(self) -> None:
>          finally:
>              assert self._qmp_connection is None
>  
> +        if self._sock_pair:
> +            self._sock_pair[0].close()
> +            self._sock_pair[1].close()
> +            self._sock_pair = None
> +

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


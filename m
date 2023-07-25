Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp17606ejb;
        Tue, 25 Jul 2023 11:19:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHuNZiGHHJJycFMkg04A+rYymBsFede43eCTQKrgeL7ihq5jMsrZ5OtWs6Izu6/EwASwyMs
X-Received: by 2002:a05:620a:564:b0:765:8a18:e3c0 with SMTP id p4-20020a05620a056400b007658a18e3c0mr3376805qkp.57.1690309191825;
        Tue, 25 Jul 2023 11:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690309191; cv=none;
        d=google.com; s=arc-20160816;
        b=kgfHZpE/kpD5/RlXmDCtURimYhEA+LwYjvAzIks5ufeHgOL8tlGSBmNyRTz183mipy
         1ic987RbzFUEvDNRaiCq1kPNPeBzuBnVOMRMjyNkE+viyaiqlJMNn37qncJHWrfUQDSu
         5YIOip13CZDk1f+KoA58UdNqfQrWXryyWLVnFrhGIuOy6+DOZy82nt0jobJhj5UYpN8E
         BRz32iECYGl4g0PqRhsimpqVJ2Ncgtl9qtYc9c8oc7qJfo5FAAI+Us4OKWsywZKtuC6w
         USgwmSKJePaWKSppilk4sFKgCjL7lm4LXiMsx3BuoRaWDmDy+FC5FWM8jgj4lozkDf/Z
         0nFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0vz0X2NrWsOUQa9gwS7T3X2Pfplyrb9o5o7Nkt8mPOI=;
        fh=zLQERmDA5TGOuXtIamHC2vUF6ncw0A4+dsMvQHS1arc=;
        b=IB7D/U/o8FahJDOEkMD7UAoV4Lj7U3WFFmloxiSWcTRyC5ZutmkxcXro0Wx8s4c79U
         LDmy/j5bu7p6hCImU2JDOtL5SHhq6YbNziJbjTksQz247mnXKZSzV0+XzKlhi9fKwReL
         JOxJiWJamJidZGy7Hs4w3TLobDLx8v4i2u677U519Z3N4ouHZXSIaFLA0nuJZCC+Kykt
         Ac9dTX3HoKFGR7VzIJtLxo0/DaYj3Gac2dsMUYebWAFxGpejpiLvo0sSC3lOZx1KjJdy
         oDLoOq8r+IkhHAdLRFVDKLjZZYEFWuI8lM0SYRLuVCQlGviR4xsfdlJpwKNta3Yp03Eg
         nYdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PHXPpQt6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs12-20020a05620a394c00b00767eafe9cc0si7054067qkn.418.2023.07.25.11.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PHXPpQt6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMdD-0006Jy-RG; Tue, 25 Jul 2023 14:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMdB-0006JD-H6
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qOMd9-0004HO-Jk
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690309171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0vz0X2NrWsOUQa9gwS7T3X2Pfplyrb9o5o7Nkt8mPOI=;
 b=PHXPpQt6yq+5Kjfgd3V68Sc+b4zl1ftUOfStgDkbhtI43XdPSZGGUA8JwUPHkrO0VwHkmB
 mXR2aSat4bY450VXni4HIiarM/d1O6BdbVtHLIcFDTAQuQ2Z5pnuUE29anB1k+FKgm1XZC
 7kQe7PGHIJHyefokCQJ9NYnEzCvyqOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-4fDHIQcNOF2Ygu5Gpdg_RA-1; Tue, 25 Jul 2023 14:19:27 -0400
X-MC-Unique: 4fDHIQcNOF2Ygu5Gpdg_RA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EEA186801E;
 Tue, 25 Jul 2023 18:19:24 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A962A201EC58;
 Tue, 25 Jul 2023 18:19:22 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:19:20 +0100
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
Subject: Re: [PATCH v2 3/6] python/console_socket: accept existing FD in
 initializer
Message-ID: <ZMASKL+27l1RCh2W@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-4-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725180337.2937292-4-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hfJZZHOr5tqX

On Tue, Jul 25, 2023 at 02:03:34PM -0400, John Snow wrote:
> Useful if we want to use ConsoleSocket() for a socket created by
> socketpair().
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/console_socket.py | 29 +++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


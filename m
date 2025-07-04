Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1368314dyc;
        Fri, 4 Jul 2025 10:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA4TQ9e1bSvjKCxFvQQ97OZZc+lA7bNKE+U3YGYztIyQPabK8vmZ8Pb3bgd9RiggqawQMu5m3DeCxy2A==@linaro.org
X-Google-Smtp-Source: AGHT+IGGj+uSs8eok+5bBvT8og+xcghzP3xLhEBqrQWr7kLm0/d7UqQ6SFqCufI2ja3LRKx6KycI
X-Received: by 2002:a05:622a:400e:b0:4a5:912a:7c64 with SMTP id d75a77b69052e-4a9987bee22mr53546231cf.30.1751651557119;
        Fri, 04 Jul 2025 10:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751651557; cv=none;
        d=google.com; s=arc-20240605;
        b=HOLhvIQWgCXzz5o4Gm8TS/03D/Q6ntDyX0fRHhFvWWHEoLUDqf20V9F4ioMZHYDQZ2
         dgl8sjvCSHKKFrdIQdt3LLUUJBv9GAWO8wPZ0bqk/KkAz+eTgLEkFopnczIqJz5Sdw/R
         dxBsu0chmKMqdrQ+wmPbaOBH8g/ZchPh5abLVHtwI2sFdWl9K4qebuu6otcQJD/Cp8rq
         wldEGN+3hCYi+MH8yzGIyv1F7jFXYPQDyomh3oWwpw0lCpDwsg5y7bnyioahgRzaZIWn
         LLgf3zbB/SAidlC3BrZOVXFlXLXamFDbjHXk9TkQnL7vuPVXKeCNkGFKol3tl8k6uoXK
         B7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Vl91N2rwImObNz6JhOO5IwMgEhApIRAG8zIO0n8dl/c=;
        fh=9T4YSpaK/rxjmZDsTWbgbb2dmlUmE7wRLhZE68qq/Wk=;
        b=ecgXjl8NdHudpMRsFiO1vcmla0NFlU2Sxih3Ze6HzZelBuFWq5Mo16GVCELFJdfeZ8
         Z3iByDCMMaG5/59ZtsTxP4w6WgV69+J5ynm9dMQ2Wce72X8+A9Q0flR7ID5byS6HrMUK
         f3WG3ClA6VtAtvMQjZQx94D89FKKIpXj6vIS6rAEA/oHdk4N8bKnLC3Vst3AgYczb5Id
         deit08bK8kfIgOqy4nYcDjyS89NX3J0jrRZt6Bx1iXzAdcTNFYv0A6FTlfNhCB7yS0qU
         dIRxJdcSr8tPEdNSvpN5gJRzCwPX7TZnKO15+P2BLoHumAM/N7l2c06aya9CtYSGsZcc
         EOlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fqJa4Ky3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ad2a82si22666611cf.375.2025.07.04.10.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 10:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fqJa4Ky3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXkaB-0006We-OC; Fri, 04 Jul 2025 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uXkZx-0006Sj-ME
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 13:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uXkZu-0001AV-3L
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 13:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751651513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vl91N2rwImObNz6JhOO5IwMgEhApIRAG8zIO0n8dl/c=;
 b=fqJa4Ky3K6KrKwC3pvBNCq69chMknHmQ66rhOXT6MD7/lKNsAupMnZHE/xFqxJMdDsJgTp
 0E05q986liRy+5nMH8MQQfRZFce5VI5x+HoTTtlWVe8/Ebpkvc9igwOF7eEqzkMLTrYcuh
 iR5UhUjuwaDU6sd4ITfWUVdLCHX1b0w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-tEl0hGkRPl6jpQbgsLl5LQ-1; Fri,
 04 Jul 2025 13:51:50 -0400
X-MC-Unique: tEl0hGkRPl6jpQbgsLl5LQ-1
X-Mimecast-MFC-AGG-ID: tEl0hGkRPl6jpQbgsLl5LQ_1751651509
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7F87D1944AA5; Fri,  4 Jul 2025 17:51:49 +0000 (UTC)
Received: from localhost (unknown [10.2.16.102])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8830819560A7; Fri,  4 Jul 2025 17:51:47 +0000 (UTC)
Date: Fri, 4 Jul 2025 13:49:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PULL 00/11] aspeed queue
Message-ID: <20250704174938.GA95114@fedora>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w4QmHjESI+s7DDVw"
Content-Disposition: inline
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.218, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +9RkGegpYBN0


--w4QmHjESI+s7DDVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.1 for any user-visible changes.

--w4QmHjESI+s7DDVw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmhoFDIACgkQnKSrs4Gr
c8jWOQf/WyBAOWmNggDJwxgIWbaTQ2RI6J8IhYbf0474m8t4r/xcLX8WpvRHhLRi
oJz2LK7RdF9Qd2jaZPt8yAcynGIC0HqK43cHFvPvIY3tEsWAJgrlqngk2TD5QbKj
/0fzi7Sxh3pkTHF7Srau/3f0EGzjVEdozKMl3hDqefs/BztmuKzrP9tSavd0KUko
5F4jsknA+rEGzIO49SunfbzeLH1zAfj1J0FPgXkbJqmKnOmcsHqF+GX4ggOLrD22
LRTY5793lzjZPF+s+vv5C+kNppYp45qYQEH23/bK5SB2Umqqig0ucMhtwn+Khwyo
VJkw2IG4E/vsikzdWqfoSrZeTF3bZg==
=L3af
-----END PGP SIGNATURE-----

--w4QmHjESI+s7DDVw--


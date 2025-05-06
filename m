Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3135494njj;
        Tue, 6 May 2025 06:58:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJindf1yWgJrPWzew0fhP3l4zkg3V2FNWUhQab6J7Ou3JNCtn1qYAHls8xtvGASLAnoXGKaB/hDUFIxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH2GdWz++jy1Kz62HpaQdnFGy90bIs3UJjv1vvsm1WSProN3BMYiN1TGWoPcXOW5gWCKBwj
X-Received: by 2002:a05:620a:4088:b0:7ca:cd71:2bf8 with SMTP id af79cd13be357-7cae3b02eccmr1752526585a.54.1746539939214;
        Tue, 06 May 2025 06:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746539939; cv=none;
        d=google.com; s=arc-20240605;
        b=IEW14ZXF9VM20Ae+sLca+Zz3XL3ij+HiWRQhw9pnxIgzhXxUJ14c+SyWqH6+1eztlL
         pdq/rnXIy1P6xuqX4oKPzC9YcLwZk4K3eUnRCidRGYM5EbLqj6OW63PuIeN8/V5s2svP
         Dj8nTG9dT1YIWNx7B3ZkXwl7D0e9qeVZmpYaiRcxDOMnmgT1Ej87ejRcyuHWxQl7FTmj
         orbFFGGsoCXWTLxAWHFo3pFOmQO2WqzbVFImSMC+FchR4dkIQDI+wI6/amujWnEgYfFs
         d9byKo89oKsjsMNTkxJYJ9OnmZCYN41jLkwRLc9KRRlujos2Qie9iWo+ggHh4qMO2rm0
         2Lhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xYflSMwKMeHDfXDoqwyJiaq67TOvlshTEy4qa9GuWpY=;
        fh=9T4YSpaK/rxjmZDsTWbgbb2dmlUmE7wRLhZE68qq/Wk=;
        b=MePZFL7fVRdeuwNyMuwTQsYkD3etwuPPZqRL2iKuUJuW2oxegBFeOWznfCfS7eYqvt
         r5o6IbfFvCbyhxcXcCYFWw00fJmHs1dI/VUyhdlrtvyh7NHGhAjoLPL76ADe7ADHNcY2
         JNBPJTdYXBxY+NmRlfFwEC7XE2ADBUwjj29L96FOK2Tj7KtFfdHnJVXXfFjldK0LWwnT
         nUugfj0WSmzS11SQADvFPZeb14k3J1LphG4bxl3sGD1v8zOAvj+g7ubyk8YZrvp6oL40
         khFw2O4ZMQJ1stmpGJOag30nbJ0UQGB7NAS63f6x8Cn4y3xpA2Bm3v1ZFXBDt19vpKeZ
         RPDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g93C7uMN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b987243bcsi109132971cf.415.2025.05.06.06.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 06:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g93C7uMN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uCIos-000858-Vs; Tue, 06 May 2025 09:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uCIor-00083q-N3
 for qemu-devel@nongnu.org; Tue, 06 May 2025 09:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1uCIoo-0003Ol-CX
 for qemu-devel@nongnu.org; Tue, 06 May 2025 09:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746539925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xYflSMwKMeHDfXDoqwyJiaq67TOvlshTEy4qa9GuWpY=;
 b=g93C7uMNn46AC5NN3fDMRY6lA/hisOvhsjbD7rGivAQNS2MDUbl9mZO78HtoX0Ra/SGaYt
 ciN/flq0HDI/W+F/oiIUBrePcilA5ZvK9AnUmkSc26uqgwDWfnXq4jbbAvKs6XOmHy+Wx+
 XZfsDje8hhvk+z7jUnqQ+jfebFMu0n8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-nQ3LUOD3PQWIfKmw1KF8Ig-1; Tue,
 06 May 2025 09:58:44 -0400
X-MC-Unique: nQ3LUOD3PQWIfKmw1KF8Ig-1
X-Mimecast-MFC-AGG-ID: nQ3LUOD3PQWIfKmw1KF8Ig_1746539923
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A331B1800996; Tue,  6 May 2025 13:58:42 +0000 (UTC)
Received: from localhost (unknown [10.2.16.219])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C30881800352; Tue,  6 May 2025 13:58:41 +0000 (UTC)
Date: Tue, 6 May 2025 09:58:40 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PULL 00/23] aspeed queue
Message-ID: <20250506135840.GA302893@fedora>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+GmUTu3m/F2o5KBc"
Content-Disposition: inline
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: im0PHLRPs2VA


--+GmUTu3m/F2o5KBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.0 for any user-visible changes.

--+GmUTu3m/F2o5KBc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmgaFZAACgkQnKSrs4Gr
c8hvSAgAuu9Ia4OVqt7JASIZUPeVdAJh1UlM6UPB2BKkEPj072DAfScQRT1wzq+U
gs0mT4Bw6GYvssLbDuqyP79NtXJ+QaPb5kqwvkZuvsBhLY0OOxvkbFmHD9cHcTZk
B6qMQ4PcCsfqyf8pJK9KC/5H6eJQlGRd/NzwEJr8h5bvH1/HxBb/zLV9gm0sV7Qv
fxW6yJnKwmoTr95Bqp42t5PUBoid5WR4Vxdm1zB9dcTm+zV+LEaLicTYVTBQW83f
i8MO84fGN7apjlmvgq4/Jvtb6g5euz3CnQ3O1VY1OxK2Ett/nQ/rvrvNuSCWFrrA
EiEeITXYGtdNhUw/kBMDrd+bDJeiCg==
=Mc6F
-----END PGP SIGNATURE-----

--+GmUTu3m/F2o5KBc--


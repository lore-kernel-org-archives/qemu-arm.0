Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3409999ejc;
        Mon, 16 Oct 2023 12:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtGl7Alcl/TV7jKWhSQJiPicyvWK2ilnD8opSRwMK2N6pP6viD9v8Xox94jDj9MNy7MTnU
X-Received: by 2002:a05:622a:1806:b0:412:7ba9:c7f6 with SMTP id t6-20020a05622a180600b004127ba9c7f6mr261423qtc.5.1697484069348;
        Mon, 16 Oct 2023 12:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697484069; cv=none;
        d=google.com; s=arc-20160816;
        b=iG4cgBeD2gx0QJ8+6UMB51oWr7qCvX7HPK7mNGB38NoaR0u7nhlAf2RaEtBxWkjyd1
         j2ClmPKBqnmk9LOW7Owbfhi13xOCXPgs6I35XfnpdZk2zSue3eR4PG7vz8ysTraUApeB
         Mu+Ui40kmQ1n1PYbPrptFGhqUJi6fgTZFXdPxU5y9nfua+kR7WVKZ1/FVZOfv4k6LsvC
         QmO1v/+WY5xKwJr5PZ+GuPVMsvj0wg+MGW3Ilhto6ufUHeQVFsTF+hppZj2kxkhaukCN
         FExVOsD/zDPbADMgVNeSxCulKMu48Z19Adt/GlKYE6YpM5mlTeBrWZw/OWAPpwhXoa9m
         22TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=bJQ6TUXeWmRLu4MmjGlxoY7FtLWAyLJWRk+IQFy4OVA=;
        fh=OeZlWWOcECyxhw12uAGhG42weqM5s6ntRr5MF3rstA8=;
        b=EzS1XX+lolDsTw+vmaOjNcZD7R9wGYTKw1sQ2HYgTcwkvlUQGXmyI2OkpC8eUQ+5HX
         ayAW5phODXbfUFcm903OWVr0avLrR7bQFo5gmzPpxM1sM8dy7kQuNrkTsELtmZtYuPz8
         oxK2Q1AwZpFjW15FSRDAcAJl+ppv26CSjmwH4gTlPVX2zkGQ1DYsqb477gONMTUOgYDA
         FwSzAJL9VqajqOsDioKwd1JNXDGlup0N9FME/zb4AB5egIVPf/RdQ6dKVh4gE4NHshAp
         NVw7p2OeQe4UdpLiiPYiky8T8FfQAp7EPaq2cVo4oEUV23HlBORf7vwv3qrma3OCACMw
         mI2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aoROpxeM;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r1-20020ac85c81000000b00417d39dfc3esi5738676qta.755.2023.10.16.12.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aoROpxeM;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697484068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJQ6TUXeWmRLu4MmjGlxoY7FtLWAyLJWRk+IQFy4OVA=;
	b=aoROpxeM/kBTuZz5W4YiJnZWO7ZrQhOpD309tjgZWGj34QhGeEflbmiHzu+pIg30Rebe5K
	sHVQFSS3ci0uhhaOxl1d8hDYvK+L281NSMzesQc1jm6mpZ1+U4xB6UiQTxrv2x7R9gd7od
	+VFbAXwwVNyAUGHULJIYhbpCtHKAPAk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-Ue1_Xp3ZPkOUoBXyTXtKdQ-1; Mon, 16 Oct 2023 15:21:05 -0400
X-MC-Unique: Ue1_Xp3ZPkOUoBXyTXtKdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 414A038116F2;
	Mon, 16 Oct 2023 19:21:04 +0000 (UTC)
Received: from localhost (unknown [10.39.195.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F24F63F45;
	Mon, 16 Oct 2023 19:21:02 +0000 (UTC)
Date: Mon, 16 Oct 2023 15:21:01 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Ani Sinha <anisinha@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>, qemu-s390x@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Eric Farman <farman@linux.ibm.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [PULL 00/25] Python patches
Message-ID: <20231016192101.GA161375@fedora>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aUsXHgU4QlxIxLSb"
Content-Disposition: inline
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: sCN/cAnrcjyN


--aUsXHgU4QlxIxLSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--aUsXHgU4QlxIxLSb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUtjR0ACgkQnKSrs4Gr
c8iRlgf/TguKi5ks6PxxTBbIFFoU/Tl2VnS6jPc+k8Mq5XeapFuj9vt8sR3fTquO
mEmjX6JZeJadZYh3nHc6HbtDetUHggEyRuGA5QxQd+c0qVbwdWHL82r/KXnyBxoL
heFlGN9AkcW/EYWL2MHKUjZoYg+bnivCFyPeOB4NIL9WYZacpZD/dcIDyk9jjLjU
7cj7XlyS1by6AxfM0LxanVKs3BcorOhTU0QqhhbmWl8nrCeIBso6Xw/sKcLZgWyV
5Qt5VH2IjeA2J8BPRdUVUK8KBwx/GiCiWvGbjPQDOsQ3XTzrhV4UPTM15x0AlyVs
aUsBqyQLmen671XK2mjCZbyYzP5k0w==
=Y8yD
-----END PGP SIGNATURE-----

--aUsXHgU4QlxIxLSb--

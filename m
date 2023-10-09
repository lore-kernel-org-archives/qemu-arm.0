Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1852064ejb;
        Mon, 9 Oct 2023 02:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjYXkw36f6zisHBm7231UYX9FTlB0YDTiRCnRQV9m+8PPlbQL8cFPqBsjz4LqZfYXoFR70
X-Received: by 2002:ac8:7f4a:0:b0:412:288f:3853 with SMTP id g10-20020ac87f4a000000b00412288f3853mr19339452qtk.28.1696845178307;
        Mon, 09 Oct 2023 02:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845178; cv=none;
        d=google.com; s=arc-20160816;
        b=weP93SJSYl8HvCbn1wBCNh08Am/5yL6sSXyR3uxX+1inZiHpE6F8YwCBCfqnYXiG/n
         V7GnnO3PAkEgsmXoA/J4H6Z4I908S9GrH2MlcBVvCXLKsgus9lfuOXKeVCsTkSJMtokL
         JSHDkiYlNKhCC1v9ou0p2xcswaZVfA/aLUHouPuD5a4BuxQ6AEnNFZm7cbk8VQtko53i
         0xmK+otQLkZ35+ClLcdeltkugZoHewwnQekN/SleYppnH9zZZoaTeKIUgBeKFVGkfxpi
         ahdtz9svExdWwRruPVcPK3j+xW1pq/shaE9dmcJsMToU5pXiEw0iptf8vZQVrLubi6u+
         TuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=mat4o5l5NRzOAbSXT2+884hQtlwqveRs1oyxWA2hBas=;
        fh=uXeduPm97lMfigVvYpF2Egn65TVYCPBEISE6w19o48I=;
        b=fwRTWDTekVmezYlJJ5lQk2JaPgEq0T7FbdEZQT0U2I+4Hx43LCfIVc60jLFYwlMMpH
         Tkm3EIqn6NAGn1phmpKW0RDwILl4l6d+KXWAyREP/VLdM8GvzxgmZcGrmhw20PbqX18n
         B4hYB+zoaSbDiNuaSDHAaRih76TG5ajFQErHzXLEfBoLCdihcnfBypmrU8+FaGCJb6SU
         b5skG9jFblmKEfaXVsHdlXHNKgg8Onl2HoSfuq6bKDYj3SchMiFiiYrZ5i1wpu4nbBFh
         mkz+WpnqUnNIJ7ihnr4vd4qnB0QSZonMGfXERjaIahnklwyzRc/s6IqhR0eaJd+6Vgom
         qbFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HPu2WlBl;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o9-20020a05622a138900b00418194af9ecsi5982476qtk.51.2023.10.09.02.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HPu2WlBl;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696845177;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mat4o5l5NRzOAbSXT2+884hQtlwqveRs1oyxWA2hBas=;
	b=HPu2WlBlesAjkySDySEEDUktLPUTDIEjsRVji7k4bJizxLHPK8K0kwEw9OtXhlBRNvNVBx
	3PHPRygfk+JTR56VxtIW+j6AflkVyzTA6tEIihT+pW3slAoCtFQVXsWSc5SYiXEl1Jge6p
	/UAzgyK5h02qiX91pskY5TNGg4rMl9Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-E7eJ0Fd8OByfaYPn1PqICw-1; Mon, 09 Oct 2023 05:52:40 -0400
X-MC-Unique: E7eJ0Fd8OByfaYPn1PqICw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4074f9d17a5so2439495e9.1
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 02:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845160; x=1697449960;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mat4o5l5NRzOAbSXT2+884hQtlwqveRs1oyxWA2hBas=;
        b=iNHxbGYCUWCYDz260Ngq/kws2el0xyA4g7JxMH+5aplGTAgqk7oRNdtk5AOXmqz9Yl
         fWrJ7R+c+magqz8SM5pOHBuR78PwCHRglODPuCOG/PKXE2/O71KtmHjW6jpAwpY5ZFdJ
         3gL7l4e/ZyBsiyNGs/1z4ZScJSJbeQQ+kLY7bk9NSds2xO2eSoKVogUWmTMZXOLw3UeT
         +b9yIntV2fNfC6YCv535VZx0QSFnlhLIoouVaDpwh1uAe9jKb3NGXGhehNwX3W5UA0m7
         4nXpRowrE+JKATPlf7OOrSvC+vA5LOltCKobxCX6S0/kA2qAF6jCa/z+ro8iQWnw5Qid
         qLOA==
X-Gm-Message-State: AOJu0YwsWg7ktsXa2RlYpi9gEHHOxN9fIVFgmsfm8kGronMK/2UZG+g0
	RkMywFYV4lqQ7CCmZ3LW0Hp8zOzKLfJ1vItYXKUonZoDiB5nUlH89OzRaKEmrUTtnA71ysG2Y6Y
	XtlPnP124/BIigSIM
X-Received: by 2002:a1c:7712:0:b0:401:c52c:5ed9 with SMTP id t18-20020a1c7712000000b00401c52c5ed9mr12611552wmi.32.1696845159758;
        Mon, 09 Oct 2023 02:52:39 -0700 (PDT)
X-Received: by 2002:a1c:7712:0:b0:401:c52c:5ed9 with SMTP id t18-20020a1c7712000000b00401c52c5ed9mr12611518wmi.32.1696845159391;
        Mon, 09 Oct 2023 02:52:39 -0700 (PDT)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net. [188.85.150.151])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b004063c9f68f2sm7512090wmb.26.2023.10.09.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:52:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org,  qemu-devel@nongnu.org,  jsnow@redhat.com,
  crosa@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
  eblake@redhat.com,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
  Andrew Jeffery <andrew@aj.id.au>,  Joel Stanley <joel@jms.id.au>,
  Aurelien Jarno <aurelien@aurel32.net>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  Eric Farman <farman@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,
  Fabiano Rosas <farosas@suse.de>,  Leonardo Bras <leobras@redhat.com>,
  qemu-arm@nongnu.org (open list:Integrator CP),  qemu-s390x@nongnu.org
 (open list:S390 Virtio-ccw)
Subject: Re: [PATCH v7 05/15] python/qemu: rename command() to cmd()
In-Reply-To: <20231006154125.1068348-6-vsementsov@yandex-team.ru> (Vladimir
	Sementsov-Ogievskiy's message of "Fri, 6 Oct 2023 18:41:15 +0300")
References: <20231006154125.1068348-1-vsementsov@yandex-team.ru>
	<20231006154125.1068348-6-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 09 Oct 2023 11:52:37 +0200
Message-ID: <87zg0syvfe.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 34XJSCIIT6cG

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> Use a shorter name. We are going to move in iotests from qmp() to
> command() where possible. But command() is longer than qmp() and don't
> look better. Let's rename.

I feel your pain O:-)

> You can simply grep for '\.command(' and for 'def command(' to check
> that everything is updated (command() in tests/docker/docker.py is
> unrelated).
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> [vsementsov: also update three occurrences in
>    tests/avocado/machine_aspeed.py and keep r-b]

Reviewed-by: Juan Quintela <quintela@redhat.com>

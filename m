Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1065404njf;
        Thu, 15 Aug 2024 19:26:37 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:1fb:9b91:d7c1 with SMTP id d9443c01a7336-2020404ee4cmr17653175ad.55.1723775196914;
        Thu, 15 Aug 2024 19:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723775196; cv=none;
        d=google.com; s=arc-20160816;
        b=v536fHAPRRtpOKunw4fYfzf6NtuZjqJYxXMv79B0OWMvuFXkR+hi9b/N26wBrjQbh6
         xbfDYgkHZrP9rpKlhLPFaMrfD896VpPTpb+Kw7b7CHgRHsUn93T3s9I4b/sKmkmMb/jI
         nhS9uWqBfi3MqMZaD9nAFptgIZd1j2KaHIpH9RqQHOq0oUTMxllINFhwFTskgMJq4VbR
         Ogx1j26ddxhxiiNKYdOkVL3HCalpWfHyOXld8zOrgg/2wCPDPBn0SKSYk8J1rlqiagSO
         uPGRsJY01zWn+3TXx3yRc/bY0N3MoQKwHhwWoVKBX/jMvVg7sz7lIYPUu5MaFwKaEk1Q
         h9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=XiJ95sFlW8mgrdmS+FGQG1YkX3zQYhm3/ChV9srynF0=;
        fh=piP599lK3innuaYiHH0p6ThBzd1bgkaWKn7/rWja/no=;
        b=gCqLWiPwk1wiNuLaYLMQ8INGB8NdLnwH5UlDm+5zWtE/Fp9JlN5diNKbad88qbJAMJ
         4D6HWYrpYpW21Dov2XcPYKplXU3eeDu1hNYEOu1V9B0gn+w2xyatAgdLB90Odtp1Uu9c
         1qR+eTlThv5g4TmS6w11zeVRoCnxMfuZZ/8vOCILgkaJmJuR2EvVuRPdw7TDnUG9kodK
         /zpewbD9QMxBhnP3aEo+TaCluVYmxwY9kzB14POwTSJhQhhxvb03vDmuOvq47HBKBiG/
         upvYYhzLbs0IAgcxJmWtR9Tie6g1KfIaBHSfvnv9hMyIPT3A+kJEmURv0+aV80WGQr9d
         3bRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="jR/MLRcI";
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-201f030ace9sor22885555ad.4.2024.08.15.19.26.36
        (Google Transport Security);
        Thu, 15 Aug 2024 19:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="jR/MLRcI";
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723775196; x=1724379996; darn=linaro.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiJ95sFlW8mgrdmS+FGQG1YkX3zQYhm3/ChV9srynF0=;
        b=jR/MLRcIZC7KwRUO7twnzKjlnBXKQlYqJ4a6n4QBMrBLAfsWPMbjq7Ru2PCdJJNJSE
         CeJOaGFwbtL7vFPWpqIxjsa+wpOruR14sUEQMrUhSJ2LPlhx+z9hszsTsVSIB1T7EZ3x
         a6LJEmv9dqJFFqiUwJqES9SCuWAE1nPXYfyOAdmg7vy4E8r2SFw9QkdDqYiDdlmu+J45
         iMQNLHeuiBWqzsquGvzzF5M/i+ZLpdHKaJRxP+QjcZIp08AmB5IxpCSUdFnfHJL2WkN+
         rbYtZGuCn1VUuPgBnp0iWaO0jbkbDT1IscX7eJnUN2WwhQwMnvIJGHT6TXK2k+YSOZAx
         Vzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723775196; x=1724379996;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XiJ95sFlW8mgrdmS+FGQG1YkX3zQYhm3/ChV9srynF0=;
        b=ItZ5toD5E7fdJHknAerDaGGBPBTRE+sXodRSC1OdexNYxLt4oKaQHKPLsglr5Hi4rl
         iwoSuGE0zl0Z3Kpwol/RyhcMQf7AgSuJ4IdaPBaBDyHQy0BX6Kf63z5A0FD1G6TvSURQ
         C9wEFnx6JeZFTAXAXB0TpdPyvHMN90AxTA0+lFKI+nV9zN3pO3n2VubHKxA3OvfFQErP
         aUrYnUhMBAAPaCLyJuXzQIHumkcfySyAZZBsgZJFwQBN8xyqEvSO7ornBuTWsKkDjAi5
         By/CvbCQN8aOCx4GuGlOv/oGxIK6CfrskEXpj2IIV4zoBk6xdXQnS80oKY1XDr2SzzOy
         Pccg==
X-Forwarded-Encrypted: i=1; AJvYcCUi7OE03X6VBoVlAatAU207Cwzu6d9ZmgWvi+TujbRCPYMyO4Hftu4hu5QUI8ISF69J519Jodm2zZK6/NyCwxbAZdGyp0SiOvm8tQmrcf/gbQZfTJyX9EgImK7cyBJ3rylKMTdLXOluufHYbrhUWK1G2Xu5PacAej8lOb3yVx+GhTFiOYmT4UP8f5cyZjglfzSqEWgKrAY=
X-Gm-Message-State: AOJu0YzTp+meuekv5V6aJqe6FPjJJekrGTpZ++CAqiJ2BD63SLo9w0o9
	MHGUFkg+l1jnOwQsd8V65eiy1vw2z8cv8+boGCCNqmlWcN3ZTQqk
X-Google-Smtp-Source: AGHT+IE5W/byoNs9Ba1LE24xkIbzXaBp1C2IGuE0Ma0+CTpXzATv1ZUn5JGzVmJ5HIIEGa+An/R42g==
X-Received: by 2002:a17:903:247:b0:201:ed48:f11c with SMTP id d9443c01a7336-20203c08902mr20493245ad.0.1723775195953;
        Thu, 15 Aug 2024 19:26:35 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.145.119.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039e09csm16366065ad.244.2024.08.15.19.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 19:26:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 12:26:18 +1000
Message-Id: <D3GZAWNK3B01.36WGYVZO23DPO@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 <qemu-devel@nongnu.org>, "Alistair Francis" <alistair.francis@wdc.com>,
 "Michael Roth" <michael.roth@amd.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Mahmoud Mandour" <ma.mandourr@gmail.com>, "Pavel
 Dovgalyuk" <pavel.dovgaluk@ispras.ru>, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Weiwei Li" <liwei1518@gmail.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, =?utf-8?q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, "Markus Armbruster" <armbru@redhat.com>,
 "David Hildenbrand" <david@redhat.com>, "Beraldo Leal" <bleal@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Eric Auger"
 <eric.auger@redhat.com>, "Song Gao" <gaosong@loongson.cn>,
 <qemu-arm@nongnu.org>, "Peter Xu" <peterx@redhat.com>, "Jiri Pirko"
 <jiri@resnulli.us>, "Eric Blake" <eblake@redhat.com>, "Fabiano Rosas"
 <farosas@suse.de>, <qemu-s390x@nongnu.org>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Daniel Henrique Barboza"
 <dbarboza@ventanamicro.com>, "John Snow" <jsnow@redhat.com>, "Alexandre
 Iooss" <erdnaxe@crans.org>, "Konstantin Kostiuk" <kkostiuk@redhat.com>,
 "Pierrick Bouvier" <pierrick.bouvier@linaro.org>, "Cleber Rosa"
 <crosa@redhat.com>, "Ilya Leoshkevich" <iii@linux.ibm.com>,
 <qemu-riscv@nongnu.org>, "Thomas Huth" <thuth@redhat.com>, "Paolo Bonzini"
 <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>,
 "Jason Wang" <jasowang@redhat.com>, "Bin Meng" <bmeng.cn@gmail.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, "Pavel Dovgalyuk"
 <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.18.2
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org>
 <20240813164631-mutt-send-email-mst@kernel.org>
 <D3FEPPLH78YW.3BYA9B4HYGN1U@gmail.com>
 <20240814030308-mutt-send-email-mst@kernel.org>
 <87y14z81ak.fsf@draig.linaro.org> <D3GARIYVC16C.20SXVKSIMLED4@gmail.com>
 <20240815102754-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240815102754-mutt-send-email-mst@kernel.org>
X-TUID: /5qs0jG1tGpJ

On Fri Aug 16, 2024 at 12:28 AM AEST, Michael S. Tsirkin wrote:
> On Thu, Aug 15, 2024 at 05:12:32PM +1000, Nicholas Piggin wrote:
> > Could be a good idea. Although I'm not sure what to do with
> > all types, maybe we can restrict what is supported.
> >=20
> > > Is this wider re-factoring something that can wait for the next
> > > developer cycle?
> >=20
> > I would say so. It's not quite trivial to do nicely since
> > things are a bit tangled between util/async and replay.
> >=20
> > > >> I had started on a conversion once but not completed it.
> > > >> I could resurrect if there is agreement on the API?
> > >
> > > I would certainly welcome it being cleaned up. The supported replay
> > > devices are very piecemeal at the moment.
> >=20
> > I'll tidy up and post an RFC for how the new API might look.
> >=20
> > Thanks,
> > Nick
>
> Fundamentally it's virtio net, up to Jason. I don't like messy
> APIs and people tend to get distracted and not fix them up
> if one does not make this a blocker.

Happy for objections, but FYI Michael did find the proposed API
tweak nicer, so shall we get these minimal fixes in for 9.1 then
switch them for next release?

Thanks,
Nick

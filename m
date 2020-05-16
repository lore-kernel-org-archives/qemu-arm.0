Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1067757lfb;
        Fri, 15 May 2020 20:58:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytfDDnXh9ElwlA5hqeW17OxKE40zQXLLP056HK3JJNYH76ewVxzF48ZfdO6M9aN5MyVI/L
X-Received: by 2002:a17:906:f103:: with SMTP id gv3mr5742140ejb.226.1589601506138;
        Fri, 15 May 2020 20:58:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589601506; cv=pass;
        d=google.com; s=arc-20160816;
        b=wIwXg5YPQLv9kxIfMbt3FpeaZ/eg+9Fnu0ddfobWSHrxVD0vr55Bcxj8dADT3MrmFZ
         bE59OX1RYX2nay4P6bpIYHKPnmZI+xSCAXsNFU2O/I7rh77AAOtPCbXcR51GqwUajeme
         VB6Ya4eLZ4W3fYq+Ld4wmo64Nf7mAiv1A+906Q6Oy3QcUSrnFTsoSf6az4xKtJ+WhnND
         ycmdpEP804ss6X86W/daQSpZ3sV6Zsj9sAO9dSBNS+Vzs79V1mCfOtPmOLq4wpf5gsWj
         uGHWTJwZL7B8Tw7Ob5gRoYMrdQ2aFay7FKc2+Fnta4GmVFYgn1KWd46YKgZTki0s/16i
         1HDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:subject:in-reply-to:message-id;
        bh=KxNKKVvAkleKYfMp3l2aKai9BJO3MMKsfQxWyCf+QsU=;
        b=XJPne/0E6rhuKRV+vHtoROOc1xR34jTgO2YmhdzDB0zm3OxBeks/6mCP+XOXVETIy6
         dbux//Q67mh70TguijXRenrzK3vP2ylSIryRjqrscApk2WmQtlNcCPA9fSxa/+9SCKjX
         WNAOixtfPVlEgWL+yoKILcQP+X34W38fxzo2E9imtKLDgQdavx0PAMtKjc4v5xHvG5sE
         CQOUNg1wzdc9ITPSU/Hg70qN4fRDNvUT/jknxEtuy0h9WkASy5+COhIV3jtdvo0lUIRY
         UvgRivLaJYVAPoEFOvJ3DjJWcyRP/NUiXZueIgEfjRtmBQfvaDSz8qcsIvOHyYEUPUC4
         HS8w==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com. [136.143.188.53])
        by mx.google.com with ESMTPS id dx17si2478694ejb.467.2020.05.15.20.58.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 20:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) client-ip=136.143.188.53;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1589601481; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hA2Yc27+zB8ytjMK7VmigshdA2ZZc9w+y5YDHGU1+FogR9sg3SPebgTa8e3twtqOE+p9LsPKUVk9Q0Uu/l1kDIvV1v6Li+bDSDyuK/SmONOGrROGHgqD3rYjKGBeew+osQ7+bYK3sLaHRvNh9ab8UuYmvfxED9C5zQ9dAO8Z0XY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1589601481; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=KxNKKVvAkleKYfMp3l2aKai9BJO3MMKsfQxWyCf+QsU=; 
	b=NowJ9QZnVXzcgPXJd+NfeYPPRuwRTEhgbf2ANtAQR7JNSyzUNDrcQBTQRvWetDqIoO7fCEqC5S7392CvzflNg9dqBthnpx5uGeWjWjjdp9PWVLTYoaGIp52zXM3OaclRPnQnIKBZfQ3A2YDyld8UGskRlvIgBm2Z8OXmjwtpIFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1589601479525633.7390382918733; Fri, 15 May 2020 20:57:59 -0700 (PDT)
Message-ID: <158960147692.9380.14776583689831521814@45ef0f9c86ae>
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
Subject: Re: [PATCH v2 00/10] accel: Allow targets to use Kconfig, disable semihosting by default
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, marex@denx.de, peter.maydell@linaro.org, thuth@redhat.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu, philmd@redhat.com, jcmvbkbc@gmail.com, aleksandar.qemu.devel@gmail.com, qemu-arm@nongnu.org, palmer@dabbelt.com, michael@walle.cc, pbonzini@redhat.com, Alistair.Francis@wdc.com, aleksandar.rikalo@rt-rk.com, alex.bennee@linaro.org, aurelien@aurel32.net, rth@twiddle.net
Date: Fri, 15 May 2020 20:57:59 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: sdg/LELhYG/X

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUxNTE3MDgwNC41NzA3
LTEtcGhpbG1kQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhIC9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXItaW1h
Z2UtZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1pbmd3QGZlZG9y
YSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKL3RtcC9xZW11LXRlc3Qv
c3JjL3RhcmdldC9hcm0vYXJtLXNlbWkuYzo4MTU6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHFl
bXVfc2VtaWhvc3RpbmdfY29uc29sZV9pbmMnCi90bXAvcWVtdS10ZXN0L3NyYy90YXJnZXQvYXJt
L2FybS1zZW1pLmM6Nzg3OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBxZW11X3NlbWlob3N0aW5n
X2NvbnNvbGVfb3V0cycKL3RtcC9xZW11LXRlc3Qvc3JjL3RhcmdldC9hcm0vYXJtLXNlbWkuYzo3
ODQ6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHFlbXVfc2VtaWhvc3RpbmdfY29uc29sZV9vdXRj
Jwpjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKbWFrZVsxXTogKioq
IFtNYWtlZmlsZToyMDg6IHFlbXUtc3lzdGVtLWFhcmNoNjR3LmV4ZV0gRXJyb3IgMQptYWtlOiAq
KiogW01ha2VmaWxlOjUzNDogYWFyY2g2NC1zb2Z0bW11L2FsbF0gRXJyb3IgMgptYWtlOiAqKiog
V2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNh
bGwgbGFzdCk6CiAgRmlsZSAiLi90ZXN0cy9kb2NrZXIvZG9ja2VyLnB5IiwgbGluZSA2NjQsIGlu
IDxtb2R1bGU+Ci0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkK
c3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdk
b2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD1lNDMwMGI1
MGI3NGY0Y2Y2YTQzNDJiZWJiMGRiM2U1YicsICctdScsICcxMDAxJywgJy0tc2VjdXJpdHktb3B0
JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICct
ZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICct
ZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9JywgJy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90
bXAvY2NhY2hlJywgJy12JywgJy9ob21lL3BhdGNoZXcvLmNhY2hlL3FlbXUtZG9ja2VyLWNjYWNo
ZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAt
ZF9zdTdrZl8vc3JjL2RvY2tlci1zcmMuMjAyMC0wNS0xNS0yMy41NS4zNi4xMDY2MjovdmFyL3Rt
cC9xZW11Onoscm8nLCAncWVtdTpmZWRvcmEnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAndGVzdC1t
aW5ndyddJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9LS1maWx0ZXI9
bGFiZWw9Y29tLnFlbXUuaW5zdGFuY2UudXVpZD1lNDMwMGI1MGI3NGY0Y2Y2YTQzNDJiZWJiMGRi
M2U1YgptYWtlWzFdOiAqKiogW2RvY2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBk
aXJlY3RvcnkgYC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1kX3N1N2tmXy9zcmMnCm1ha2U6
ICoqKiBbZG9ja2VyLXJ1bi10ZXN0LW1pbmd3QGZlZG9yYV0gRXJyb3IgMgoKcmVhbCAgICAybTIw
Ljk0MXMKdXNlciAgICAwbTguNDg5cwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0
cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA1MTUxNzA4MDQuNTcwNy0xLXBoaWxtZEByZWRoYXQu
Y29tL3Rlc3RpbmcuZG9ja2VyLW1pbmd3QGZlZG9yYS8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

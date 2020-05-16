Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1061805lfb;
        Fri, 15 May 2020 20:45:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy89aefoTa4tBgqlUBDy1p4OhlKNzSFBEwyp/Bb6uWs4LjfdS4eZd1Ikhu8PZWnBHVWVD6h
X-Received: by 2002:a05:6402:1bc1:: with SMTP id ch1mr5725786edb.90.1589600699897;
        Fri, 15 May 2020 20:44:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589600699; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q/hj1/wuHqP99MvbOQ5Tn8jdH0JVRzbqlEZaiZ+i70B4ezaPUU0lZ/m8GlNGcC7ar2
         BzeSdWvdK3WoxUYPuegJdTC7Q/CZUY79nDktSJ2Wr+SNC0wjNVeKyPYFPVeXeH8RdBi9
         SWcQiW60ANtjJulaQ56ZsEOjkitKjDoUx/Bqk2WJQ/zPIIDhlV0uRN2ZOXMU2rrIiaXM
         W2PKb2gpXHGmMNf033VvDgTK/UttBySgi4OKRqqCEpbtl+RT16V9Mm+WIc0k9hhy4hM2
         W71/KL9HPXEhaDUe5F2qjaTRrqW9m6FerKpIrSYlAmxEG4CZwt4hiMrRa2mKnLYjRv7P
         V6Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:subject:in-reply-to:message-id;
        bh=r9DbX6QuYHi9v2VdRPD4Oy7Sn9ES4IxIe8CIg7iIcqA=;
        b=creY/BhdGEdzoArPu2a9yj8HF4O0oun3oqcoRgSKgJRSd/DCdy4iIGHWLLHG4Ele2T
         +wc4Nx+h2jXZspC7fj5Sjc3A6ZwMVuWepHBxLrXkoHzH0BSSdi90wQ1ZhKc6KENXMcmC
         oDDYT6vcLFYhiwhmmWgt5l0LiVAVdXC189Yk0ADR1Jl82ZOhy6wm29OgdcwxbspOtz0u
         0AFkeFN94ShTknXGlIbr9i6lvrCu4s1y69U0ATPTldJ/siPtWkT3A3vVtbrwRYCvPLua
         a+XOfUG9YCzhMfplJD8QbMzWVnWq8bOLh1vUbjD1TLUHWB0eG8lefaX+8oLH9YRoOLCR
         R/2Q==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com. [136.143.188.53])
        by mx.google.com with ESMTPS id u20si2330393edd.545.2020.05.15.20.44.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 20:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) client-ip=136.143.188.53;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1589600671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UPNJRF4uhkEN4Ez+XRgxcqrCsLCqdIxl30hIvAMeQi0qBP/V7e68cCtOZLuBtIqLfi1+akYVt8oxbvCp6LMFmoBSmbUYm9w9p69zCbQVo40SAY+X7IrEzvNN199GC/DL6ci3eayWPf0c6+SPMgdZL56XcZCK6z8NpO++aHnWVxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1589600671; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=r9DbX6QuYHi9v2VdRPD4Oy7Sn9ES4IxIe8CIg7iIcqA=; 
	b=JcvWKi21LSnXm/XtIF8pd+0J9rALc/DZarvhqOoInvBGajwiHAPTvhaR7sbjx0JQ+dCGQytJkk9f9bcdPwPwZIklbQ8t0n9ye3XAUd9b94wd0boZ/b60JUsjirAX+LrIO3o9Fs5vOHT2WiBilLogI3yJ9TiQ0W2sEdoMJUyBpTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1589600669937532.6377436954517; Fri, 15 May 2020 20:44:29 -0700 (PDT)
Message-ID: <158960066736.9380.1957181284132319006@45ef0f9c86ae>
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
Date: Fri, 15 May 2020 20:44:29 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: 7GFW/6Nt6A3I

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUxNTE3MDgwNC41NzA3
LTEtcGhpbG1kQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBkb2Nr
ZXItcXVpY2tAY2VudG9zNyBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1jZW50b3M3IFY9MSBORVRX
T1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LXF1aWNrQGNlbnRvczcgU0hPV19FTlY9MSBKPTE0
IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKL3RtcC9xZW11LXRlc3Qvc3JjL3Rh
cmdldC9hcm0vYXJtLXNlbWkuYzo3ODc6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHFlbXVfc2Vt
aWhvc3RpbmdfY29uc29sZV9vdXRzJwovdG1wL3FlbXUtdGVzdC9zcmMvdGFyZ2V0L2FybS9hcm0t
c2VtaS5jOjgxNTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcWVtdV9zZW1paG9zdGluZ19jb25z
b2xlX2luYycKL3RtcC9xZW11LXRlc3Qvc3JjL3RhcmdldC9hcm0vYXJtLXNlbWkuYzo3ODQ6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYHFlbXVfc2VtaWhvc3RpbmdfY29uc29sZV9vdXRjJwpjb2xs
ZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKbWFrZVsxXTogKioqIFtxZW11
LXN5c3RlbS1hYXJjaDY0XSBFcnJvciAxCm1ha2U6ICoqKiBbYWFyY2g2NC1zb2Z0bW11L2FsbF0g
RXJyb3IgMgpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiLi90ZXN0
cy9kb2NrZXIvZG9ja2VyLnB5IiwgbGluZSA2NjQsIGluIDxtb2R1bGU+CiAgICBzeXMuZXhpdCht
YWluKCkpCi0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3Vi
cHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdkb2Nr
ZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD00OTBiZjE4YjQx
ZTA0ZGY1ODE4MmJkYjE5OTZiODk2YicsICctdScsICcxMDAzJywgJy0tc2VjdXJpdHktb3B0Jywg
J3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScs
ICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScs
ICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9MScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1w
L2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hl
Oi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1r
MDNvZTV5aC9zcmMvZG9ja2VyLXNyYy4yMDIwLTA1LTE1LTIzLjQxLjQzLjIxNjI5Oi92YXIvdG1w
L3FlbXU6eixybycsICdxZW11OmNlbnRvczcnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAndGVzdC1x
dWljayddJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9LS1maWx0ZXI9
bGFiZWw9Y29tLnFlbXUuaW5zdGFuY2UudXVpZD00OTBiZjE4YjQxZTA0ZGY1ODE4MmJkYjE5OTZi
ODk2YgptYWtlWzFdOiAqKiogW2RvY2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBk
aXJlY3RvcnkgYC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1rMDNvZTV5aC9zcmMnCm1ha2U6
ICoqKiBbZG9ja2VyLXJ1bi10ZXN0LXF1aWNrQGNlbnRvczddIEVycm9yIDIKCnJlYWwgICAgMm00
NS40MjBzCnVzZXIgICAgMG04LjI1N3MKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwNTE1MTcwODA0LjU3MDctMS1waGlsbWRAcmVkaGF0
LmNvbS90ZXN0aW5nLmRvY2tlci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3Jn
L10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

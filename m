Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1037284wrv;
        Tue, 16 Jul 2019 07:15:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEUdRn8v9LEPcpSYjKXBCnmHYfePWp0W8Hq7l8Uilwg0MWAACiTddKUX+dAsKoIXVChLP2
X-Received: by 2002:a81:3295:: with SMTP id y143mr19640194ywy.328.1563286530763;
        Tue, 16 Jul 2019 07:15:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563286530; cv=pass;
        d=google.com; s=arc-20160816;
        b=hrB1PNpZH/JLEIMazbWv5tijOZyIawPBgb3En4Rsexg7MiouNKmXE8sBS0ILYPdt7q
         LJQNcZXQpjz8z3rKtKlKrtXWTRappJp/vlCYAe+ZGGsuOw6zhh8op467+DO9PfjBwZfD
         6i3mETvcOg+IKv0bYe3Ym/DgcghapsS8jamFHX48k340YYRWXn/BhSdFQ4WCuaMZkI2X
         JbvRHPT13lTLISzZn3fwp2wzGv5zobwwwcGmNZv90271VdUOZpZ9qcLPwlULxXIqlukb
         Z/XOBxV8F3lUjbeCSV+7jO3rwRTv+Pr/LKOhfA9oZfhZvHOzuPeHy/TK2DGOdr2M7xgE
         VBYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:in-reply-to:subject:message-id;
        bh=mKESzVD2dSHs6Co5PY1b54s2EhLh2vWJuz6cSoRYUAs=;
        b=m+Ek9tM9F+kFZ1zfm0lCoswb3wdiizrgeUdhG3UNQKWpg/w8c4uvY61ocn+EkBoB2h
         ksl253/IrUrRrtQyMPJ5E5oQ/qtitJNRBoN1w4Y8XG5nwWVDA20AKvaO3WZLbvHVPVrH
         bGez7h5YfHYSXesiWd6q+xejj1PXEQxnbAnAdcGdWA1nyr2BW+ZGT0CmDPBL5Me60y38
         E5aXMK20t5RV1j0k4bInttw60REV/WZiBJ0QEUCT00AeAPLgFXM/Cr09FI+1k1cQwbQb
         BF5TdFr6sSuu9H1yxlDTysMyFLDWWYZzls9Snmvva00k8Y7kRPj/vfeuIqOdbkvauXld
         qCrg==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.59 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o59.zoho.com (sender4-of-o59.zoho.com. [136.143.188.59])
        by mx.google.com with ESMTPS id x13si9314907ybf.454.2019.07.16.07.15.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 07:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.59 as permitted sender) client-ip=136.143.188.59;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.59 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1563286483; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=CrD+LVZQvYLe13ovF7vgjFzkCNFEn8HJISHKYSVr5SlOI58Py2+FL5vLi5UQZ/JV9SWEWwa0p+Y/yen6wCvqqGNdewohow9lZ8tL3sQFbwVewYF3U8z9LwOoBZmv/5zOjtWk4YiN7OgI6ebevrTOHyp2vIkUqXNZHM2mI9MDOto=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1563286483; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=mKESzVD2dSHs6Co5PY1b54s2EhLh2vWJuz6cSoRYUAs=; 
	b=YXNv5kP8UoPcHoRlwKkdqcdV5TMlpwOzVL1LFFDhIpRJoUhqBH9lAnir7bpW0bzHwbrPgBKhJa2XEyR+XDHC0YDqJWTpiTY6g1A7Lkdwv19IQmZd+gpKxKfY81NOTNRvdVvX+BKtQowLOIQeX25vtr14hEENkGXBL3DjLz6SeKM=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1563286481320244.7377986805792; Tue, 16 Jul 2019 07:14:41 -0700 (PDT)
Message-ID: <156328647934.3080.7715534955297688180@c4a48874b076>
Subject: Re: [Qemu-devel] [RFC PATCH-for-4.1? v2 0/5] semihosting: Build with CONFIG_SEMIHOSTING disabled
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, thuth@redhat.com, arikalo@wavecomp.com, jhogan@kernel.org, riku.voipio@iki.fi, laurent@vivier.eu, philmd@redhat.com, qemu-arm@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com, james.hogan@mips.com, alex.bennee@linaro.org, aurelien@aurel32.net
Date: Tue, 16 Jul 2019 07:14:41 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: d/8kYnhPKTba

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxNTE1MjIyNS4yNjEz
NS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWlsZCB0
ZXN0IG9uIHMzOTB4IGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93LgoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAojIFRlc3Rpbmcgc2NyaXB0IHdpbGwgYmUg
aW52b2tlZCB1bmRlciB0aGUgZ2l0IGNoZWNrb3V0IHdpdGgKIyBIRUFEIHBvaW50aW5nIHRvIGEg
Y29tbWl0IHRoYXQgaGFzIHRoZSBwYXRjaGVzIGFwcGxpZWQgb24gdG9wIG9mICJiYXNlIgojIGJy
YW5jaApzZXQgLWUKCmVjaG8KZWNobyAiPT09IEVOViA9PT0iCmVudgoKZWNobwplY2hvICI9PT0g
UEFDS0FHRVMgPT09IgpycG0gLXFhCgplY2hvCmVjaG8gIj09PSBVTkFNRSA9PT0iCnVuYW1lIC1h
CgpDQz0kSE9NRS9iaW4vY2MKSU5TVEFMTD0kUFdEL2luc3RhbGwKQlVJTEQ9JFBXRC9idWlsZApt
a2RpciAtcCAkQlVJTEQgJElOU1RBTEwKU1JDPSRQV0QKY2QgJEJVSUxECiRTUkMvY29uZmlndXJl
IC0tY2M9JENDIC0tcHJlZml4PSRJTlNUQUxMCm1ha2UgLWo0CiMgWFhYOiB3ZSBuZWVkIHJlbGlh
YmxlIGNsZWFuIHVwCiMgbWFrZSBjaGVjayAtajQgVj0xCm1ha2UgaW5zdGFsbAo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKICBDQyAgICAgIG1pcHMtbGludXgtdXNlci90YXJnZXQvbWlwcy9nZGJz
dHViLm8KICBDQyAgICAgIG1pcHMtbGludXgtdXNlci90YXJnZXQvbWlwcy9tc2FfaGVscGVyLm8K
ICBDQyAgICAgIG1pcHNlbC1saW51eC11c2VyL3RhcmdldC9taXBzL21pcHMtc2VtaS1zdHVicy5v
Ci92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC0zZGtkbTVmdC9zcmMvdGFyZ2V0L21pcHMvbWlw
cy1zZW1pLXN0dWJzLmM6MTk6NjogZXJyb3I6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCY
aGVscGVyX2RvX3NlbWlob3N0aW5n4oCZIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlc10KICAg
MTkgfCB2b2lkIGhlbHBlcl9kb19zZW1paG9zdGluZyhDUFVNSVBTU3RhdGUgKmVudikKICAgICAg
fCAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVh
dGVkIGFzIGVycm9ycwotLS0KICBDQyAgICAgIG1pcHM2NC1saW51eC11c2VyL2ZwdS9zb2Z0Zmxv
YXQubwogIENDICAgICAgbWlwcy1saW51eC11c2VyL3RhcmdldC9taXBzL21pcHMtc2VtaS1zdHVi
cy5vCiAgQ0MgICAgICBtaXBzNjQtbGludXgtdXNlci9nZGJzdHViLm8KL3Zhci90bXAvcGF0Y2hl
dy10ZXN0ZXItdG1wLTNka2RtNWZ0L3NyYy90YXJnZXQvbWlwcy9taXBzLXNlbWktc3R1YnMuYzox
OTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhoZWxwZXJfZG9fc2VtaWhv
c3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQogICAxOSB8IHZvaWQgaGVscGVy
X2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0ZSAqZW52KQogICAgICB8ICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCi0t
LQogIENDICAgICAgbWlwczY0LWxpbnV4LXVzZXIvYWNjZWwvdGNnL3RjZy1ydW50aW1lLWd2ZWMu
bwogIENDICAgICAgbWlwczY0ZWwtbGludXgtdXNlci90YXJnZXQvbWlwcy9taXBzLXNlbWktc3R1
YnMubwogIENDICAgICAgbWlwczY0LWxpbnV4LXVzZXIvYWNjZWwvdGNnL2NwdS1leGVjLm8KL3Zh
ci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTNka2RtNWZ0L3NyYy90YXJnZXQvbWlwcy9taXBzLXNl
bWktc3R1YnMuYzoxOTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhoZWxw
ZXJfZG9fc2VtaWhvc3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQogICAxOSB8
IHZvaWQgaGVscGVyX2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0ZSAqZW52KQogICAgICB8ICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQg
YXMgZXJyb3JzCi0tLQogIENDICAgICAgbWlwczY0LWxpbnV4LXVzZXIvdGFyZ2V0L21pcHMvZ2Ri
c3R1Yi5vCiAgQ0MgICAgICBtaXBzNjQtbGludXgtdXNlci90YXJnZXQvbWlwcy9tc2FfaGVscGVy
Lm8KICBDQyAgICAgIG1pcHM2NC1saW51eC11c2VyL3RhcmdldC9taXBzL21pcHMtc2VtaS1zdHVi
cy5vCi92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC0zZGtkbTVmdC9zcmMvdGFyZ2V0L21pcHMv
bWlwcy1zZW1pLXN0dWJzLmM6MTk6NjogZXJyb3I6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYaGVscGVyX2RvX3NlbWlob3N0aW5n4oCZIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlc10K
ICAgMTkgfCB2b2lkIGhlbHBlcl9kb19zZW1paG9zdGluZyhDUFVNSVBTU3RhdGUgKmVudikKICAg
ICAgfCAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0
cmVhdGVkIGFzIGVycm9ycwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3Bh
dGNoZXcub3JnL2xvZ3MvMjAxOTA3MTUxNTIyMjUuMjYxMzUtMS1waGlsbWRAcmVkaGF0LmNvbS90
ZXN0aW5nLnMzOTB4Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

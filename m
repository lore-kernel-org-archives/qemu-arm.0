Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1308708wri;
        Thu, 31 Oct 2019 08:22:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXRF8x0pM7YARV6TfUXZx0UCbMfvrBvLfD1Pem8MBVKZP+kcahAEK3+2rACxOxkCtWvsBs
X-Received: by 2002:a17:906:4347:: with SMTP id z7mr4755851ejm.117.1572535327679;
        Thu, 31 Oct 2019 08:22:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572535327; cv=pass;
        d=google.com; s=arc-20160816;
        b=IwKsCfaantr2lJrtSxOLorpW5Nzv+dblSypQK4Cs3GOXmPGIvSr0aPjcmhTPDdLrhp
         jMxcGKL/1T08qSN41nS2H2QgrmBQ1YxV+fGh3uokgWcv9vSDHheaFZGCfnWOWWlEsUv/
         RQF5GAiO6QuYLWvWAOqDP0n2XHF4PhRVgIISPmniY9/QZmYl+vNCa09AJQmrtwR6e4O5
         /7caPDsxwOhOvEBdVTkQ6bh+pGmxJ273Vqb58k54eWRsEq8UlFj1RAqM95n84oEVpDPq
         u1ukfYDlVcoZqo9AGugm3xwJsVtid3/62s4PrT6CFPY35DMGWVXvRGPn5i5qONPDnaXU
         s4Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=X3O1OS0JrUqhqvd6K512c347eV+loxhfdHFlu9zmiy8=;
        b=Bf2p/tbqI870H1/8kRx+9vywb4Rxut/DFHsQSm5N3CoEXA2w1R6BukiOeqiRA373lm
         gdetqa8nmJHuaFjhcdpaSux1i9P4v7qIGc5C/4MLRlSmL6sZuNdIKEUXXDeCzNhiYTLW
         eTXFDgCezqDct1/sNKPtktt1fy3SmCxb9VkoF1NLOZc1N/5g78U9VH1TS4WftV1XqF41
         pCt7nbodBndJhBHNn0Eb7CfdH5sj1uu+r0B6IbPHEq8r7z0RClC6IKs6wKK43N2Sh+k9
         qN++RbBM8LN2sleY05jLOewMIEPr1FKREto0DRxyn1FV19kKXRAoUHep8FIDJZPSWkZp
         vyCQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com. [136.143.188.54])
        by mx.google.com with ESMTPS id z7si4326924edi.318.2019.10.31.08.22.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 08:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) client-ip=136.143.188.54;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1572535316; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PWMxEuNvsdpnrw97D0R1JO0ninsmfP3+bcaRekvApNybEXorq+tTv9kXu+xJ2smwcq5DuBgaB6Zoyhy/TjRZxio/z+6LsMbHhLPHzw55fC84dwA2AoDgs0VCrpG7+0vDkmyGs2+GHLmG/uGMaePAbW5EEVAB5znoRWk4frtrHiM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1572535316; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=X3O1OS0JrUqhqvd6K512c347eV+loxhfdHFlu9zmiy8=; 
	b=ixatXBGGrXW3BugkzV+Rg45MD08H5DJj7ViEmSaQ4m/m23eEKWY1Hv1w27Z9WE6xSR50jub5JLRHUM5wVHaBjyfVK1R+RWXc6DT3hOAur19menm6vWOekiaOx2tlAtzWRT5WRr+9rjeVqToGeM0mlEkQ4pRcXY0WXxHxoFxoXvc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1572535314801945.0166992561481; Thu, 31 Oct 2019 08:21:54 -0700 (PDT)
In-Reply-To: <20191031142734.8590-1-drjones@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 0/9] target/arm/kvm: enable SVE in guests
Message-ID: <157253531305.11413.526716657261084490@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: drjones@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, m.mizuma@jp.fujitsu.com, beata.michalska@linaro.org, richard.henderson@linaro.org, armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Date: Thu, 31 Oct 2019 08:21:54 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: K/+HmGBC1GSU

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAzMTE0MjczNC44NTkw
LTEtZHJqb25lc0ByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgVEVTVCAgICBpb3Rlc3QtcWNv
dzI6IDI2OApGYWlsdXJlczogMTYxCkZhaWxlZCAxIG9mIDEwOCBpb3Rlc3RzCm1ha2U6ICoqKiBb
Y2hlY2stdGVzdHMvY2hlY2stYmxvY2suc2hdIEVycm9yIDEKVHJhY2ViYWNrIChtb3N0IHJlY2Vu
dCBjYWxsIGxhc3QpOgogIEZpbGUgIi4vdGVzdHMvZG9ja2VyL2RvY2tlci5weSIsIGxpbmUgNjYy
LCBpbiA8bW9kdWxlPgogICAgc3lzLmV4aXQobWFpbigpKQotLS0KICAgIHJhaXNlIENhbGxlZFBy
b2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQpCnN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yOiBD
b21tYW5kICdbJ3N1ZG8nLCAnLW4nLCAnZG9ja2VyJywgJ3J1bicsICctLWxhYmVsJywgJ2NvbS5x
ZW11Lmluc3RhbmNlLnV1aWQ9NmFmZjVlOTBmZDExNGM0YThjYzNkNjJkNzgyNmI4N2YnLCAnLXUn
LCAnMTAwMycsICctLXNlY3VyaXR5LW9wdCcsICdzZWNjb21wPXVuY29uZmluZWQnLCAnLS1ybScs
ICctZScsICdUQVJHRVRfTElTVD0nLCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09QVFM9JywgJy1l
JywgJ1Y9JywgJy1lJywgJ0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NIT1dfRU5WPTEn
LCAnLWUnLCAnQ0NBQ0hFX0RJUj0vdmFyL3RtcC9jY2FjaGUnLCAnLXYnLCAnL2hvbWUvcGF0Y2hl
dzIvLmNhY2hlL3FlbXUtZG9ja2VyLWNjYWNoZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcv
dmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtd212cDFmYWIvc3JjL2RvY2tlci1zcmMuMjAxOS0x
MC0zMS0xMS4wOS41NC4xNDU0ODovdmFyL3RtcC9xZW11Onoscm8nLCAncWVtdTpjZW50b3M3Jywg
Jy92YXIvdG1wL3FlbXUvcnVuJywgJ3Rlc3QtcXVpY2snXScgcmV0dXJuZWQgbm9uLXplcm8gZXhp
dCBzdGF0dXMgMi4KZmlsdGVyPS0tZmlsdGVyPWxhYmVsPWNvbS5xZW11Lmluc3RhbmNlLnV1aWQ9
NmFmZjVlOTBmZDExNGM0YThjYzNkNjJkNzgyNmI4N2YKbWFrZVsxXTogKioqIFtkb2NrZXItcnVu
XSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRl
c3Rlci10bXAtd212cDFmYWIvc3JjJwptYWtlOiAqKiogW2RvY2tlci1ydW4tdGVzdC1xdWlja0Bj
ZW50b3M3XSBFcnJvciAyCgpyZWFsICAgIDExbTU5LjQyMXMKdXNlciAgICAwbTguMzg1cwoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTEw
MzExNDI3MzQuODU5MC0xLWRyam9uZXNAcmVkaGF0LmNvbS90ZXN0aW5nLmRvY2tlci1xdWlja0Bj
ZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJh
Y2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

Received: by 10.28.71.27 with SMTP id u27csp2310333wma;
        Thu, 22 Feb 2018 11:04:02 -0800 (PST)
X-Google-Smtp-Source: AH8x225e4XIykCxhxQbrWWYkLP2YVLafSsaXFOD4Nw5HaP6l4m08mB1GfxGTlENgbH877mOtSmDT
X-Received: by 10.13.202.18 with SMTP id m18mr5482275ywd.16.1519326242322;
        Thu, 22 Feb 2018 11:04:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519326242; cv=none;
        d=google.com; s=arc-20160816;
        b=s361Sa/5oCNJWEAFOdGLJ0uEtxX3iW3AZPTAPoVSbYvx+y6SI3X3/33T+XJgW1YkK2
         pN7Mo5RgTMeQ8P6xkMk5fiGwq4mqqCkFyBNuJ3CSReq3tn71UUwGT0nHD7EWcy1Kvx4T
         lQ47snYxc89oWbQaeMHCgYj0DwzTUAgHHkNjWhU0yNbFqhPD/tvxzMApi07/03us4tgO
         Kup7YkRbmXipk99uIyQoZSX/pmmeg4J0uLTLDj66Wf5nWN5fEN2gaW4EbWlCYmMByut1
         FJpB2YnCdwtEaf9R6aXgsiOIbPYzdpZiXKbdXAaZ2AjENgrHHJ+YNeOs+zM5P/OjKxdj
         wK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=ImW3w0412Xq0kwX9HzyVyxRRtI3dA1plONegiWoxD7w=;
        b=oB3WvATM3lpHp/Eohe5bwRhnUsVPtQ6RV3dY4Yph1d/Xh3DOUOiA4nL4CGQcdxktyQ
         I2CBaSvpZC27ScPeW4P7Y7DJ/oIQHAwtJHdXArAgdkIU7ZLFhMtmGWPj5JOxT1hvTrmB
         lKLuqqPurOTGGDaw5gtmMO5UjM5E2Dq78CyTOmhQwBxcuaKcemHKsii+zNbNeFtT/atd
         znvW1IEnltENMh9FJgR5mtLvgsdkpDKi3CUZNDXVc0jUdxIes4t67XqWheiWC+WdmbiT
         MXd51ezlYOA2yDlMoYw/VtFouVMX67EVcXq/IhmkH4B60WLBxD/a4j+XGYo/lbHGv5Mb
         QDsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w137-v6si115080ybe.444.2018.02.22.11.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 11:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eow9x-0007xc-Np
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 14:04:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eow9j-0007vC-S1
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:03:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eow9i-0001NV-EU
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:03:47 -0500
Resent-Date: Thu, 22 Feb 2018 14:03:47 -0500
Resent-Message-Id: <E1eow9i-0001NV-EU@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1eow9Z-0001IC-VO; Thu, 22 Feb 2018 14:03:38 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1519326202902879.310043115212;
	Thu, 22 Feb 2018 11:03:22 -0800 (PST)
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
Message-ID: <151932620203.726.14470172414364772802@bdbb90650ae5>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Thu, 22 Feb 2018 11:03:22 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/19] Add Cortex-M33 and
 mps2-an505 board model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, famz@redhat.com, qemu-devel@nongnu.org,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rgHgAE2X1UXU

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMjIwMTgwMzI1LjI5ODE4LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
ClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMDAvMTldIEFkZCBDb3J0ZXgtTTMzIGFuZCBt
cHMyLWFuNTA1IGJvYXJkIG1vZGVsCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdj
IC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
YWxnb3JpdGhtIGhpc3RvZ3JhbQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2
ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQ
QVRDSCAkbi8kdG90YWw6ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAgIGlm
ICEgZ2l0IHNob3cgJGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAt
LW1haWxiYWNrIC07IHRoZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZpCiAg
ICBuPSQoKG4rMSkpCmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoK
VXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hl
ZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmUxODBlYjBiMTggbXBzMi1hbjUwNTogTmV3IGJvYXJk
IG1vZGVsOiBNUFMyIHdpdGggQU41MDUgQ29ydGV4LU0zMyBGUEdBIGltYWdlCmU5ZDk2OTFkNjYg
aHcvYXJtL2lvdGtpdDogTW9kZWwgQXJtIElPVCBLaXQKNzFhNWQ5NjFmNSBody9taXNjL2lvdGtp
dC1zZWNjdGw6IEFkZCByZW1haW5pbmcgc2ltcGxlIHJlZ2lzdGVycwo0MzQzZDIxNjgzIGh3L21p
c2MvaW90a2l0LXNlY2N0bDogQWRkIGhhbmRsaW5nIGZvciBQUENzCjU5YjQ2MDVkNWIgaHcvbWlz
Yy9pb3RraXQtc2VjY3RsOiBBcm0gSW9UIEtpdCBzZWN1cml0eSBjb250cm9sbGVyIGluaXRpYWwg
c2tlbGV0b24KNzNjZmIyY2ExNSBody9taXNjL3R6LXBwYzogTW9kZWwgVHJ1c3Rab25lIHBlcmlw
aGVyYWwgcHJvdGVjdGlvbiBjb250cm9sbGVyCjM2MzM4YmFmNGQgaHcvbWlzYy9tcHMyLWZwZ2Fp
bzogRlBHQSBjb250cm9sIGJsb2NrIGZvciBNUFMyIEFONTA1CmI1YThiOWUyNWQgaHcvY29yZS9z
cGxpdC1pcnE6IERldmljZSB0aGF0IHNwbGl0cyBJUlEgbGluZXMKZTI4YzBjMzg0YSBxZGV2OiBB
ZGQgbmV3IHFkZXZfaW5pdF9ncGlvX2luX25hbWVkX3dpdGhfb3BhcXVlKCkKOTJhMTFiMmZiMCBp
bmNsdWRlL2h3L29yLWlycS5oOiBBZGQgbWlzc2luZyBpbmNsdWRlIGd1YXJkCjg2MTI5MGQyM2Qg
aHcvbWlzYy91bmltcDogTW92ZSBzdHJ1Y3QgdG8gaGVhZGVyIGZpbGUKY2RkODQxZGY0NiB0YXJn
ZXQvYXJtOiBBZGQgQ29ydGV4LU0zMwo5NGFkN2NkMTE0IGFybXY3bTogRm9yd2FyZCBpbml0LXN2
dG9yIHByb3BlcnR5IHRvIENQVSBvYmplY3QKZjVjNjdhZmVjNSB0YXJnZXQvYXJtOiBEZWZpbmUg
aW5pdC1zdnRvciBwcm9wZXJ0eSBmb3IgdGhlIHJlc2V0IHNlY3VyZSBWVE9SIHZhbHVlCjFlNTQw
NDRhYzQgYXJtdjdtOiBGb3J3YXJkIGlkYXUgcHJvcGVydHkgdG8gQ1BVIG9iamVjdAo4ZDJlZGFm
ODk5IHRhcmdldC9hcm06IERlZmluZSBhbiBJREFVIGludGVyZmFjZQozYThkODkyNmM1IGh3L2Fy
bS9hcm12N206IEhvbm91ciBDUFUncyBhZGRyZXNzIHNwYWNlIGZvciBpbWFnZSBsb2FkcwoyYTA1
MDk1ZDk4IGh3L2FybS9ib290OiBIb25vdXIgQ1BVJ3MgYWRkcmVzcyBzcGFjZSBmb3IgaW1hZ2Ug
bG9hZHMKZTM2NWNjZjg4YiBsb2FkZXI6IEFkZCBuZXcgbG9hZF9yYW1kaXNrX2FzKCkKCj09PSBP
VVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTk6IGxvYWRlcjogQWRkIG5ldyBsb2Fk
X3JhbWRpc2tfYXMoKS4uLgpDaGVja2luZyBQQVRDSCAyLzE5OiBody9hcm0vYm9vdDogSG9ub3Vy
IENQVSdzIGFkZHJlc3Mgc3BhY2UgZm9yIGltYWdlIGxvYWRzLi4uCkNoZWNraW5nIFBBVENIIDMv
MTk6IGh3L2FybS9hcm12N206IEhvbm91ciBDUFUncyBhZGRyZXNzIHNwYWNlIGZvciBpbWFnZSBs
b2Fkcy4uLgpDaGVja2luZyBQQVRDSCA0LzE5OiB0YXJnZXQvYXJtOiBEZWZpbmUgYW4gSURBVSBp
bnRlcmZhY2UuLi4KQ2hlY2tpbmcgUEFUQ0ggNS8xOTogYXJtdjdtOiBGb3J3YXJkIGlkYXUgcHJv
cGVydHkgdG8gQ1BVIG9iamVjdC4uLgpDaGVja2luZyBQQVRDSCA2LzE5OiB0YXJnZXQvYXJtOiBE
ZWZpbmUgaW5pdC1zdnRvciBwcm9wZXJ0eSBmb3IgdGhlIHJlc2V0IHNlY3VyZSBWVE9SIHZhbHVl
Li4uCkNoZWNraW5nIFBBVENIIDcvMTk6IGFybXY3bTogRm9yd2FyZCBpbml0LXN2dG9yIHByb3Bl
cnR5IHRvIENQVSBvYmplY3QuLi4KQ2hlY2tpbmcgUEFUQ0ggOC8xOTogdGFyZ2V0L2FybTogQWRk
IENvcnRleC1NMzMuLi4KQ2hlY2tpbmcgUEFUQ0ggOS8xOTogaHcvbWlzYy91bmltcDogTW92ZSBz
dHJ1Y3QgdG8gaGVhZGVyIGZpbGUuLi4KQ2hlY2tpbmcgUEFUQ0ggMTAvMTk6IGluY2x1ZGUvaHcv
b3ItaXJxLmg6IEFkZCBtaXNzaW5nIGluY2x1ZGUgZ3VhcmQuLi4KQ2hlY2tpbmcgUEFUQ0ggMTEv
MTk6IHFkZXY6IEFkZCBuZXcgcWRldl9pbml0X2dwaW9faW5fbmFtZWRfd2l0aF9vcGFxdWUoKS4u
LgpDaGVja2luZyBQQVRDSCAxMi8xOTogaHcvY29yZS9zcGxpdC1pcnE6IERldmljZSB0aGF0IHNw
bGl0cyBJUlEgbGluZXMuLi4KQ2hlY2tpbmcgUEFUQ0ggMTMvMTk6IGh3L21pc2MvbXBzMi1mcGdh
aW86IEZQR0EgY29udHJvbCBibG9jayBmb3IgTVBTMiBBTjUwNS4uLgpDaGVja2luZyBQQVRDSCAx
NC8xOTogaHcvbWlzYy90ei1wcGM6IE1vZGVsIFRydXN0Wm9uZSBwZXJpcGhlcmFsIHByb3RlY3Rp
b24gY29udHJvbGxlci4uLgpDaGVja2luZyBQQVRDSCAxNS8xOTogaHcvbWlzYy9pb3RraXQtc2Vj
Y3RsOiBBcm0gSW9UIEtpdCBzZWN1cml0eSBjb250cm9sbGVyIGluaXRpYWwgc2tlbGV0b24uLi4K
V0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzUzMDogRklMRTogaW5jbHVkZS9ody9t
aXNjL2lvdGtpdC1zZWNjdGwuaDoxNDoKKyAqIGh0dHA6Ly9pbmZvY2VudGVyLmFybS5jb20vaGVs
cC9pbmRleC5qc3A/dG9waWM9L2NvbS5hcm0uZG9jLmVjbTA2MDEyNTYvaW5kZXguaHRtbAoKdG90
YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCA1MTMgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgpDaGVja2luZyBQQVRDSCAxNi8xOTogaHcvbWlzYy9p
b3RraXQtc2VjY3RsOiBBZGQgaGFuZGxpbmcgZm9yIFBQQ3MuLi4KQ2hlY2tpbmcgUEFUQ0ggMTcv
MTk6IGh3L21pc2MvaW90a2l0LXNlY2N0bDogQWRkIHJlbWFpbmluZyBzaW1wbGUgcmVnaXN0ZXJz
Li4uCkNoZWNraW5nIFBBVENIIDE4LzE5OiBody9hcm0vaW90a2l0OiBNb2RlbCBBcm0gSU9UIEtp
dC4uLgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNjYwOiBGSUxFOiBpbmNsdWRl
L2h3L2FybS9pb3RraXQuaDoxMzoKKyAqIGh0dHA6Ly9pbmZvY2VudGVyLmFybS5jb20vaGVscC9p
bmRleC5qc3A/dG9waWM9L2NvbS5hcm0uZG9jLmVjbTA2MDEyNTYvaW5kZXguaHRtbAoKdG90YWw6
IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCA3MTggbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgpDaGVja2luZyBQQVRDSCAxOS8xOTogbXBzMi1hbjUwNTog
TmV3IGJvYXJkIG1vZGVsOiBNUFMyIHdpdGggQU41MDUgQ29ydGV4LU0zMyBGUEdBIGltYWdlLi4u
CkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNTQ6IEZJTEU6IGh3L2FybS9tcHMyLXR6
LmM6MjE6CisgKiBodHRwczovL2RldmVsb3Blci5hcm0uY29tL3Byb2R1Y3RzL3N5c3RlbS1kZXNp
Z24vZGV2ZWxvcG1lbnQtYm9hcmRzL2ZwZ2EtcHJvdG90eXBpbmctYm9hcmRzL21wczIKCkVSUk9S
OiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNTc6IEZJTEU6IGh3L2FybS9tcHMyLXR6LmM6MjQ6
CisgKiBodHRwOi8vaW5mb2NlbnRlci5hcm0uY29tL2hlbHAvdG9waWMvY29tLmFybS5kb2MuMTAw
MTEyXzAyMDBfMDZfZW4vdmVyc2F0aWxlX2V4cHJlc3NfY29ydGV4X21fcHJvdG90eXBpbmdfc3lz
dGVtc192Mm1fbXBzMl9hbmRfdjJtX21wczJwbHVzX3RlY2huaWNhbF9yZWZlcmVuY2VfMTAwMTEy
XzAyMDBfMDZfZW4ucGRmCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNjM6IEZJ
TEU6IGh3L2FybS9tcHMyLXR6LmM6MzA6CisgKiAgIGh0dHA6Ly9pbmZvY2VudGVyLmFybS5jb20v
aGVscC9pbmRleC5qc3A/dG9waWM9L2NvbS5hcm0uZG9jLmVjbTA2MDEyNTYvaW5kZXguaHRtbAoK
dG90YWw6IDIgZXJyb3JzLCAxIHdhcm5pbmdzLCA1MTAgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRj
aCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJy
b3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNl
ZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNv
bW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBm
ZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5vcmc=


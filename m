Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3780113wrx;
        Mon, 25 Mar 2019 05:13:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsYynqriA2US9rBCdYiDtIYlE0M4x5hNKRHojB2JhoNqgTj1bDP53k39DH7zthwWD0sodz
X-Received: by 2002:a81:430a:: with SMTP id q10mr21355311ywa.508.1553516017199;
        Mon, 25 Mar 2019 05:13:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si8993009ybw.88.2019.03.25.05.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 05:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8OTw-0007Uo-M5
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 08:13:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h8OTU-0007Ud-C2
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 08:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h8OTR-0007Gg-7Y
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 08:13:08 -0400
Resent-Date: Mon, 25 Mar 2019 08:13:06 -0400
Resent-Message-Id: <E1h8OTR-0007Gg-7Y@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21098)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h8OTM-0007E9-Lf; Mon, 25 Mar 2019 08:13:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1553515931; cv=none; d=zoho.com; s=zohoarc; 
	b=d76J0nkzsPU6tzPBjGb+jqI/rHmASDi5L6F03Ir2gAcVryoWSBODKWXFORccM7EVuOh81Ujp6KcJMX3mU/0AmAAYmttfexeJw0KkUC7CYkf+6U5zzC2aI2erVSrojwKgMQAik1+NRkR8wDG8uMCj6X6TQ8d/HD/Jiqx4idrnIVU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1553515931;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=5Pq6idBIt5NqGFq6MkvjwHN5QLgtgR9QGoA5GeOXyXk=; 
	b=V8BjX2zFsdg+uV/mVNK2GLhzZBkK6N/oIiqGrETLqSzDFl7BvxGXkrmPhgq+NXsOGB4a1kK4plEvsH8+CCx8i5WnqIHcN9s8KxHMTCRDNS+YcmDBPHqGxuYkLSrLeqYFJGp/YGyNa9w81pN4nDi38Ah9+5Oz3aZ1f+yQBC8qKYQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1553515929055635.9939254700272;
	Mon, 25 Mar 2019 05:12:09 -0700 (PDT)
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
Message-ID: <155351592732.24.887477524058120405@b782c5aab522>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: damien.hedde@greensocs.com
Date: Mon, 25 Mar 2019 05:12:09 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-devel] [RFC 00/17] multi-phase reset mechanism
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: fam@euphon.net, edgar.iglesias@xilinx.com, pbonzini@redhat.com,
	peter.maydell@linaro.org, mark.burton@greensocs.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	damien.hedde@greensocs.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XFHulCZIZYQs

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNTUzNTEwNzM3Lmdp
dC5kYW1pZW4uaGVkZGVAZ3JlZW5zb2NzLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQg
dGhlIGFzYW4gYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5k
CnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNh
biBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9
PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LWRlYnVnQGZlZG9yYSBUQVJHRVRf
TElTVD14ODZfNjQtc29mdG1tdSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKL3Vzci9iaW4vbGQ6IC90bXAvcWVtdS10ZXN0L3NyYy9pbmNsdWRlL2h3L3Jlc2V0dGFibGUu
aDo4MDogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcmVzZXR0YWJsZV9kZWFzc2VydF9yZXNldCcK
Y2xhbmcrKyAtTC90bXAvcWVtdS10ZXN0L2J1aWxkL2R0Yy9saWJmZHQgIC1JL3Vzci9pbmNsdWRl
L3BpeG1hbi0xICAtSS90bXAvcWVtdS10ZXN0L3NyYy9kdGMvbGliZmR0IC1XZXJyb3IgLURIQVNf
TElCU1NIMl9TRlRQX0ZTWU5DICAtcHRocmVhZCAtSS91c3IvaW5jbHVkZS9nbGliLTIuMCAtSS91
c3IvbGliNjQvZ2xpYi0yLjAvaW5jbHVkZSAgLWZQSUUgLURQSUUgLW02NCAtbWN4MTYgLURfR05V
X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0xBUkdFRklMRV9TT1VSQ0UgLVdzdHJp
Y3QtcHJvdG90eXBlcyAtV3JlZHVuZGFudC1kZWNscyAtV2FsbCAtV3VuZGVmIC1Xd3JpdGUtc3Ry
aW5ncyAtV21pc3NpbmctcHJvdG90eXBlcyAtZm5vLXN0cmljdC1hbGlhc2luZyAtZm5vLWNvbW1v
biAtZndyYXB2IC1zdGQ9Z251OTkgIC1Xbm8tc3RyaW5nLXBsdXMtaW50IC1Xbm8taW5pdGlhbGl6
ZXItb3ZlcnJpZGVzIC1XZXhwYW5zaW9uLXRvLWRlZmluZWQgLVdlbmRpZi1sYWJlbHMgLVduby1z
aGlmdC1uZWdhdGl2ZS12YWx1ZSAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1XZW1wdHktYm9k
eSAtV25lc3RlZC1leHRlcm5zIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQt
c2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XdHlwZS1s
aW1pdHMgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtSS91c3IvaW5jbHVkZS9wMTEta2l0LTEg
ICAgLUkvdXNyL2luY2x1ZGUvbGlicG5nMTYgIC1JL3Vzci9pbmNsdWRlL3NwaWNlLTEgLUkvdXNy
L2luY2x1ZGUvc3BpY2Utc2VydmVyIC1JL3Vzci9pbmNsdWRlL2NhY2FyZCAtSS91c3IvaW5jbHVk
ZS9nbGliLTIuMCAtSS91c3IvbGliNjQvZ2xpYi0yLjAvaW5jbHVkZSAtSS91c3IvaW5jbHVkZS9u
c3MzIC1JL3Vzci9pbmNsdWRlL25zcHI0IC1wdGhyZWFkIC1JL3Vzci9pbmNsdWRlL2xpYm1vdW50
IC1JL3Vzci9pbmNsdWRlL2Jsa2lkIC1JL3Vzci9pbmNsdWRlL3V1aWQgLUkvdXNyL2luY2x1ZGUv
cGl4bWFuLTEgIC1JL3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzIC1mc2FuaXRpemU9dW5kZWZpbmVk
IC1mc2FuaXRpemU9YWRkcmVzcyAtZyAgLVdsLC0td2Fybi1jb21tb24gLVdsLC16LHJlbHJvIC1X
bCwteixub3cgLXBpZSAtbTY0IC1nICAtbyB0ZXN0cy90ZXN0LWNyeXB0by1zZWNyZXQgdGVzdHMv
dGVzdC1jcnlwdG8tc2VjcmV0Lm8gYXV0aHovYmFzZS5vIGF1dGh6L3NpbXBsZS5vIGF1dGh6L2xp
c3QubyBhdXRoei9saXN0ZmlsZS5vIGNyeXB0by9pbml0Lm8gY3J5cHRvL2hhc2gubyBjcnlwdG8v
aGFzaC1uZXR0bGUubyBjcnlwdG8vaG1hYy5vIGNyeXB0by9obWFjLW5ldHRsZS5vIGNyeXB0by9h
ZXMubyBjcnlwdG8vZGVzcmZiLm8gY3J5cHRvL2NpcGhlci5vIGNyeXB0by90bHNjcmVkcy5vIGNy
eXB0by90bHNjcmVkc2Fub24ubyBjcnlwdG8vdGxzY3JlZHNwc2subyBjcnlwdG8vdGxzY3JlZHN4
NTA5Lm8gY3J5cHRvL3Rsc3Nlc3Npb24ubyBjcnlwdG8vc2VjcmV0Lm8gY3J5cHRvL3JhbmRvbS1n
bnV0bHMubyBjcnlwdG8vcGJrZGYubyBjcnlwdG8vcGJrZGYtbmV0dGxlLm8gY3J5cHRvL2l2Z2Vu
Lm8gY3J5cHRvL2l2Z2VuLWVzc2l2Lm8gY3J5cHRvL2l2Z2VuLXBsYWluLm8gY3J5cHRvL2l2Z2Vu
LXBsYWluNjQubyBjcnlwdG8vYWZzcGxpdC5vIGNyeXB0by94dHMubyBjcnlwdG8vYmxvY2subyBj
cnlwdG8vYmxvY2stcWNvdy5vIGNyeXB0by9ibG9jay1sdWtzLm8gcW9tL29iamVjdC5vIHFvbS9j
b250YWluZXIubyBxb20vcW9tLXFvYmplY3QubyBxb20vb2JqZWN0X2ludGVyZmFjZXMubyAgbGli
cWVtdXV0aWwuYSAgIC1sbSAtbHogIC1sZ3RocmVhZC0yLjAgLXB0aHJlYWQgLWxnbGliLTIuMCAg
IC1scnQgLWx6IC1sdXRpbCAtbGNhcC1uZyAtbG5ldHRsZSAgLWxnbnV0bHMgIApjbGFuZysrIC1M
L3RtcC9xZW11LXRlc3QvYnVpbGQvZHRjL2xpYmZkdCAgLUkvdXNyL2luY2x1ZGUvcGl4bWFuLTEg
IC1JL3RtcC9xZW11LXRlc3Qvc3JjL2R0Yy9saWJmZHQgLVdlcnJvciAtREhBU19MSUJTU0gyX1NG
VFBfRlNZTkMgIC1wdGhyZWFkIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWI2NC9n
bGliLTIuMC9pbmNsdWRlICAtZlBJRSAtRFBJRSAtbTY0IC1tY3gxNiAtRF9HTlVfU09VUkNFIC1E
X0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmljdC1wcm90b3R5
cGVzIC1XcmVkdW5kYW50LWRlY2xzIC1XYWxsIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlz
c2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYg
LXN0ZD1nbnU5OSAgLVduby1zdHJpbmctcGx1cy1pbnQgLVduby1pbml0aWFsaXplci1vdmVycmlk
ZXMgLVdleHBhbnNpb24tdG8tZGVmaW5lZCAtV2VuZGlmLWxhYmVscyAtV25vLXNoaWZ0LW5lZ2F0
aXZlLXZhbHVlIC1Xbm8tbWlzc2luZy1pbmNsdWRlLWRpcnMgLVdlbXB0eS1ib2R5IC1XbmVzdGVk
LWV4dGVybnMgLVdmb3JtYXQtc2VjdXJpdHkgLVdmb3JtYXQteTJrIC1XaW5pdC1zZWxmIC1XaWdu
b3JlZC1xdWFsaWZpZXJzIC1Xb2xkLXN0eWxlLWRlZmluaXRpb24gLVd0eXBlLWxpbWl0cyAtZnN0
YWNrLXByb3RlY3Rvci1zdHJvbmcgIC1JL3Vzci9pbmNsdWRlL3AxMS1raXQtMSAgICAtSS91c3Iv
aW5jbHVkZS9saWJwbmcxNiAgLUkvdXNyL2luY2x1ZGUvc3BpY2UtMSAtSS91c3IvaW5jbHVkZS9z
cGljZS1zZXJ2ZXIgLUkvdXNyL2luY2x1ZGUvY2FjYXJkIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4w
IC1JL3Vzci9saWI2NC9nbGliLTIuMC9pbmNsdWRlIC1JL3Vzci9pbmNsdWRlL25zczMgLUkvdXNy
L2luY2x1ZGUvbnNwcjQgLXB0aHJlYWQgLUkvdXNyL2luY2x1ZGUvbGlibW91bnQgLUkvdXNyL2lu
Y2x1ZGUvYmxraWQgLUkvdXNyL2luY2x1ZGUvdXVpZCAtSS91c3IvaW5jbHVkZS9waXhtYW4tMSAg
LUkvdG1wL3FlbXUtdGVzdC9zcmMvdGVzdHMgLWZzYW5pdGl6ZT11bmRlZmluZWQgLWZzYW5pdGl6
ZT1hZGRyZXNzIC1nICAtV2wsLS13YXJuLWNvbW1vbiAtV2wsLXoscmVscm8gLVdsLC16LG5vdyAt
cGllIC1tNjQgLWcgIC1vIHRlc3RzL3Rlc3QtY3J5cHRvLXRsc2NyZWRzeDUwOSB0ZXN0cy90ZXN0
LWNyeXB0by10bHNjcmVkc3g1MDkubyB0ZXN0cy9jcnlwdG8tdGxzLXg1MDktaGVscGVycy5vIHRl
c3RzL3BraXhfYXNuMV90YWIubyBhdXRoei9iYXNlLm8gYXV0aHovc2ltcGxlLm8gYXV0aHovbGlz
dC5vIGF1dGh6L2xpc3RmaWxlLm8gY3J5cHRvL2luaXQubyBjcnlwdG8vaGFzaC5vIGNyeXB0by9o
YXNoLW5ldHRsZS5vIGNyeXB0by9obWFjLm8gY3J5cHRvL2htYWMtbmV0dGxlLm8gY3J5cHRvL2Fl
cy5vIGNyeXB0by9kZXNyZmIubyBjcnlwdG8vY2lwaGVyLm8gY3J5cHRvL3Rsc2NyZWRzLm8gY3J5
cHRvL3Rsc2NyZWRzYW5vbi5vIGNyeXB0by90bHNjcmVkc3Bzay5vIGNyeXB0by90bHNjcmVkc3g1
MDkubyBjcnlwdG8vdGxzc2Vzc2lvbi5vIGNyeXB0by9zZWNyZXQubyBjcnlwdG8vcmFuZG9tLWdu
dXRscy5vIGNyeXB0by9wYmtkZi5vIGNyeXB0by9wYmtkZi1uZXR0bGUubyBjcnlwdG8vaXZnZW4u
byBjcnlwdG8vaXZnZW4tZXNzaXYubyBjcnlwdG8vaXZnZW4tcGxhaW4ubyBjcnlwdG8vaXZnZW4t
cGxhaW42NC5vIGNyeXB0by9hZnNwbGl0Lm8gY3J5cHRvL3h0cy5vIGNyeXB0by9ibG9jay5vIGNy
eXB0by9ibG9jay1xY293Lm8gY3J5cHRvL2Jsb2NrLWx1a3MubyBxb20vb2JqZWN0Lm8gcW9tL2Nv
bnRhaW5lci5vIHFvbS9xb20tcW9iamVjdC5vIHFvbS9vYmplY3RfaW50ZXJmYWNlcy5vICBsaWJx
ZW11dXRpbC5hICAtbHRhc24xIC1sbSAtbHogIC1sZ3RocmVhZC0yLjAgLXB0aHJlYWQgLWxnbGli
LTIuMCAgIC1scnQgLWx6IC1sdXRpbCAtbGNhcC1uZyAtbG5ldHRsZSAgLWxnbnV0bHMgIApjbGFu
Zy03OiBlcnJvcjogbGlua2VyIGNvbW1hbmQgZmFpbGVkIHdpdGggZXhpdCBjb2RlIDEgKHVzZSAt
diB0byBzZWUgaW52b2NhdGlvbikKbWFrZTogKioqIFsvdG1wL3FlbXUtdGVzdC9zcmMvcnVsZXMu
bWFrOjEyNDogdGVzdHMvdGVzdC1xZGV2LWdsb2JhbC1wcm9wc10gRXJyb3IgMQptYWtlOiAqKiog
V2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNh
bGwgbGFzdCk6CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy9jb3Zlci4xNTUzNTEwNzM3LmdpdC5kYW1pZW4uaGVkZGVAZ3JlZW5zb2NzLmNvbS90
ZXN0aW5nLmFzYW4vP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNh
bGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBm
ZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


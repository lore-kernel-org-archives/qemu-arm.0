Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3720969wrq;
        Mon, 18 Jun 2018 02:58:38 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLM3pN2dQpCaLYm53eqdNgsWLEhGAJGesubtxkK4m2G4t50nR3ooVgpRE/gqnV0QrstQ3mR
X-Received: by 2002:a0c:896d:: with SMTP id 42-v6mr9919055qvq.177.1529315918459;
        Mon, 18 Jun 2018 02:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529315918; cv=none;
        d=google.com; s=arc-20160816;
        b=h9Lk8XGn1TXuar7bgASBN0k/NRrb7c6rO901xdB4ZzXQ7cpkEmQyv6p2Vp9/Jr8s8z
         lFnExdMXZTymT5Dupg1qxIQhG+wlyfk1M/P+Bzwt9cC70gc1L8HLiCIu/5Zd3tnY+vTZ
         7h09/ypYjt7hFtWHOL+2vCwE3ry8wWNZkYBfAKhcEN6CSo9jKQtC6GGWIAzfoQySVZ+M
         EjTD6/649UlBqufjvdJT4pTu6Er1E72Kmc10FwLakC6t3Y9I7kPmawfNOQfSesJPuEhY
         BGuATEymVPZMhFvQZ4Q2i3HvWnBJ9baT9aEXLoyDZccNA63HYS+cO1L29j9DxmMALyqj
         0fVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=lbd3lTu2iJY/gmVsB3f5EvCd0E3FBOh6JRd12IQQXYo=;
        b=a7OyLI6GkzylRkYaW7GX5idExnFYPCPVjdL4LMCXJ+XpFvpL1EQUH00jQ6kQnS2att
         +xRoG8YBqu+kDIuNBFwKJI3bskThKVCTOQsKEZFCdBnAmKQ7vRla90r/MVH2K6c2x+X3
         liWLqw8QYj/Tuum69uZpuOU9eXbZEN4J+pdUM+ZSg7hi8PkwegZNsLKt1wsnhADiFN0l
         PmBEEl+s/HhUpV0NLrUbCt6v4bpl4AZ3F+EXPE53wS31x41yTkA2s2ie0BFnoh3i6mRx
         r/YAO8vqamcxaNoivIXqGGp0bKGdHs8QuWAfwkWkIufVVhrnoKYUC4KYPR1AY9J/1Yhh
         UN6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q42-v6si4797355qtb.151.2018.06.18.02.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 02:58:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUqvl-0001Wi-UL
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 05:58:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvD-0001Il-Th
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fUqvA-0003IG-St
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 05:58:03 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57152 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fUqvA-0003Hs-Nu; Mon, 18 Jun 2018 05:58:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2906481663C5;
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D1BA2026D68;
	Mon, 18 Jun 2018 09:57:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 691F13B6; Mon, 18 Jun 2018 11:57:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Jun 2018 11:57:55 +0200
Message-Id: <20180618095758.5006-2-kraxel@redhat.com>
In-Reply-To: <20180618095758.5006-1-kraxel@redhat.com>
References: <20180618095758.5006-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 18 Jun 2018 09:58:00 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 1/4] configure: print virglrenderer version
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lwRMEOb5jQvn

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
Message-id: 20180525153609.13187-1-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 configure | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index a8c4094c87..6b2bcb3a0d 100755
--- a/configure
+++ b/configure
@@ -4599,6 +4599,7 @@ int main(void) { virgl_renderer_poll(); return 0; }
 EOF
   virgl_cflags=3D$($pkg_config --cflags virglrenderer 2>/dev/null)
   virgl_libs=3D$($pkg_config --libs virglrenderer 2>/dev/null)
+  virgl_version=3D$($pkg_config --modversion virglrenderer 2>/dev/null)
   if $pkg_config virglrenderer >/dev/null 2>&1 && \
      compile_prog "$virgl_cflags" "$virgl_libs" ; then
     virglrenderer=3D"yes"
@@ -5827,7 +5828,7 @@ echo "nettle            $nettle $(echo_version $net=
tle $nettle_version)"
 echo "nettle kdf        $nettle_kdf"
 echo "libtasn1          $tasn1"
 echo "curses support    $curses"
-echo "virgl support     $virglrenderer"
+echo "virgl support     $virglrenderer $(echo_version $virglrenderer $vi=
rgl_version)"
 echo "curl support      $curl"
 echo "mingw32 support   $mingw32"
 echo "Audio drivers     $audio_drv_list"
--=20
2.9.3


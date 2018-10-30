Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440430wro;
        Tue, 30 Oct 2018 04:24:15 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fhzv71RNllqxm57M1d4o3BIMvJDkO3Nry8fWPlAP6nm0NW4iRLbyT67wktCqMqkWzV8D0c
X-Received: by 2002:adf:f712:: with SMTP id r18-v6mr17805664wrp.85.1540898655844;
        Tue, 30 Oct 2018 04:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898655; cv=none;
        d=google.com; s=arc-20160816;
        b=haVXb9yVm8RkOI5IpZ+4I1RnOhHuLi45qcjK8Dvxn4mjdpw5SCNPUE3sl0/BDDt47E
         YuR32CI++wqxXUQB9bfRQJ5J9kSiOc2ArmW3SGEPAjMq2KO59KDswKcAAwZNAiqjcSf1
         xDcxqltLXupATuOy1UygtOKiHz1TPh5vb8j0mg9hDX5/H6S6dHckFGsIi5lVA6/B9lUJ
         BbxfiYnIk2dKK0vvrhhV/S8laHwh6KvXiETTYAF8wCEVrTbFpHsOAD0z71XOdXmKCE2I
         WTDyWRDOHn1XaXytwpkGrEEFcyeirF8dkIrRV3rYcebbY0sZ0T37ejIKpdtXRVI9k7af
         zIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=88O8zWo5gTsUf5Y4ILIm1tH947c0Qcevkv0KFcaRItM=;
        b=T2kV3VggFH6ed35wORe4WiRhtIiu8jlf1Vfjzk8ni53PWTOgLMHEpDGhP/Bwsiz7hT
         TnUWG+94FC9Z5/x2GfKmIcdzrOaHYHSIk5nxUet9j3B7ud/48RNXyFP+6FnHZVjL/R37
         iBmR4bKmE1bwOVq0fKBBOzspN7uRTLX9SGOfJ0KoHnw91l3F+RPrSeHy/pL6uZrru/6m
         Jiv18QSyWl1jWbFr54GIp/Ch/SAWv4ZRYIW7ZLmgi+XjyIPp/aBz3VhaeH52E0Nz5l1O
         jqjSS2jhCQRS3SwglEZcRnzsiEySSWYg4w+y7QsUqTQca8lUIpgmRdZ3/V8fpGbIe8GF
         cfUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id r20-v6si2144458wmc.18.2018.10.30.04.24.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:15 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MCsgS-1gQDZW2FWq-008tOU; Tue, 30 Oct 2018 12:24:14 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MCsgS-1gQDZW2FWq-008tOU; Tue, 30 Oct 2018 12:24:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 14/20] qobject: Catch another straggler for use of qdict_put_str()
Date: Tue, 30 Oct 2018 12:23:31 +0100
Message-Id: <20181030112337.17973-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g5ba0aGiQIhKNZQKzBcM73r/UbedX9z9Q+bwBO3E5dSMCN4T4ND
 Xj4biXxswOFgZ0M2GQW/WZwxl8HPlr6S/wqvU7CUDa4NeUJu16QR2WRS3hqa7Z4cuWr3sQw
 FLbu5kybqWRnoCmrq2o0VjvSiJ9Z60rfpjAtSUYsHN7TlRSjGFGAbhcxeSnLPxFB7gWu/Nz
 E7vb6avBOhIvrF2HRzuOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:dSiTzJmTzx0=:bY02KXQE/BFOriVgAZE9k0
 vBF1sd4moRPgEuKkwXeU1B2tsSb/Gq7YoM3wf6FL9mABQDT8uv9gs2iD9VUMfKywyfJ1SxgQh
 AS4pwdOKnrJMUizp8aijtoRQHAcjM9CLaMJl/fcdZhlYSvZAUrNNuuoVfsrdhfZPptZKy1oqj
 shdZu2qLIETz2qBHDQHS6+u4CZC7NZ22jcx3I9eaHjTVRyIesRlok0yG+DkW6sSQcwqzFgwL6
 0cYKVvHv3M+GfvF832OnEF6EJtApVBKoZCjBIFnjyayXoSK+1CME/UFvUtEYtd5wWoACtHo9A
 6uVtpG2WLed1ol3z/PkKmgjSfFKZDugW6pFaMZxm8JSSxjflU/NyPzBXTI3gvjM4g7YWKsvkQ
 LSOOvI0HegcNnsuDHnfJTnFksOgqyubFygKZurLhEX59iulVoQLEOHDDofG0Vov/he5bz/+BO
 OJW+fLy4vZE10SOb5WlpPOizbAdAyG4Zu+zOSsFaOcd7efvpYp2TKb8rshzsT4pFtk4yp96jA
 +zWvYP+5Aj8DriABJEMxxFm158+XLv3ynqrEeJjyDAXD0ngKv2zODwd8yo5jF7SMH1k/l2fdE
 jy6lI3krKnfoPya5Hoi2DO6H83Gqf7gaNJoBVShKAmVYUZN7tZpj9lq4rODXKczZ4luAY3vDb
 xgkTGutX/u/W9BisJq/oHpHgFxZgnqVkrAzGqbzsYMggGmHUNqGIPZl40cv7BYpP7SdaHAIqR
 llNI4dJu1DsWD91L
X-TUID: 2gWowuKF9AwT

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/qobject.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qobject/block-qdict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 42054cc274..1487cc5dd8 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -577,7 +577,7 @@ static QObject *qdict_crumple_for_keyval_qiv(QDict *src, Error **errp)
         if (!tmp) {
             tmp = qdict_clone_shallow(src);
         }
-        qdict_put(tmp, ent->key, qstring_from_str(s));
+        qdict_put_str(tmp, ent->key, s);
         g_free(buf);
     }
 
-- 
2.17.2

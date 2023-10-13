Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722530ejc;
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwNhzbJfJeGVRJdRCQgV7+GT1FZ2Lhggwj9eBu44fJGgp5LmeazuDSntpQkIG1WDqJvf5R
X-Received: by 2002:a05:6512:4028:b0:505:6ef8:2544 with SMTP id br40-20020a056512402800b005056ef82544mr3441999lfb.63.1697224202217;
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224202; cv=none;
        d=google.com; s=arc-20160816;
        b=v8J0WRrmbk6+XdFdmjJD/JQ1MW98m+eqZMg+vfJiMa6nMVTpx3MtU+xJR02XI9DVig
         P7xODSxED9x3CAKw9bhZKAOKMOZJ1LM/O8o59w0j0zldQdhPe0+Pm6HBSpXi8ajVJA2Q
         y0rwkdZHt/AL85CiOj2w1dmry6hRN9zNzW9+Gm41ZqcpURchvC8O6X/SX3sz4c03GclU
         2/P7nI2I9MtcY9vLU1EJNJi9URFaB/wQ/eDZZp93n/QOJ+TpX74AkT0sMOH6UGnaOzSZ
         /OtaTRLCe+v/UctYmSRWMp8r+2DDnHZbD++MVXpT21IIGmGi6lbiCptNoE2w4SPFQtR8
         cBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TxjBcwAKy5hKEG8R8bR7k9fKvAnIttJRBhG+jyK2Scw=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=j0mbqPUjApee3AEg++PyGGMw7iX1WQrHQ3Bn1wcjno+GDAtfN8rbscIC5lYndsHonb
         6dC5lxST+0A5I7iQTmKpu8SMsGmkQHz3oS2pjuJ1ObERj7GNsh+36njexqP0RlktK7bQ
         pvrS2LL0QPK8XpeCcEXt62h7KYFCTZNbLfbkOhsLjdYR7/t2Wr+oWjgd6VrMX2QbOkem
         Als1aOxM/k2XHY3VZ+NcQY6PChz5roPg2LAxEiuw0gk0opwq32VxthZOouoI+OWmkdEJ
         NPdNvYT6rbVLDzOOuFyYLOvBqbuE0SweyY37YhQsZZ5QjoroBkyEzXXRbpH9Km2DctE1
         /NNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekUTdG0g;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i16-20020a056512007000b0050079fead7asi638975lfo.125.2023.10.13.12.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ekUTdG0g;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxjBcwAKy5hKEG8R8bR7k9fKvAnIttJRBhG+jyK2Scw=;
	b=ekUTdG0gHKTn88dB859slAzvaU/KPcnns28q/HgWE791rRyjjRmOQORUQBQgCBgSiLSe6L
	ls3mWx5nG/bmdzZDfLRMZ5XzXr0rLMJ+A0MvL2p+oiEVksp9vUrTrahWO9WL0ehCMiRkot
	Q6D02/D4IiSjPk3rLlNZJ/37CnJsbr8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-CHZrUiKTMCC1DZsEJ4i6Rg-1; Fri, 13 Oct 2023 15:09:56 -0400
X-MC-Unique: CHZrUiKTMCC1DZsEJ4i6Rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FCB52810D45;
	Fri, 13 Oct 2023 19:09:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA3B940C6CA0;
	Fri, 13 Oct 2023 19:09:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Ani Sinha <anisinha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	John Snow <jsnow@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 09/25] configure: fix error message to say Python 3.8
Date: Fri, 13 Oct 2023 15:09:24 -0400
Message-ID: <20231013190941.3699288-10-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: hhMAtpRRvJTr

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-id: 20231006195243.3131140-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8fada85a71..a49fc7b7e7 100755
--- a/configure
+++ b/configure
@@ -948,7 +948,7 @@ then
     # If first_python is set, there was a binary somewhere even though
     # it was not suitable.  Use it for the error message.
     if test -n "$first_python"; then
-        error_exit "Cannot use '$first_python', Python >= 3.7 is required." \
+        error_exit "Cannot use '$first_python', Python >= 3.8 is required." \
             "Use --python=/path/to/python to specify a supported Python."
     else
         error_exit "Python not found. Use --python=/path/to/python"
-- 
2.41.0

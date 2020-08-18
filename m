Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3921803lfy;
        Tue, 18 Aug 2020 08:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSOkoSGTaoUdRcFepkPEK+P4ijCSPibZ9RwTGVfBuRcRCxRBg/ksCdGT5YOp8+r7zIcNH7
X-Received: by 2002:a5b:789:: with SMTP id b9mr3934971ybq.19.1597764112525;
        Tue, 18 Aug 2020 08:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597764112; cv=none;
        d=google.com; s=arc-20160816;
        b=FVNzDtGFc20oF+t70hmyutq9s2pU4WQGen4NRBWU42Av/tUv8P9ZCkG87ubOHHEz1x
         Wjg1rICM0Kqnx1N3UgdRJ1FAGIWyH8LWHrCYOuX1TWLbtV+dc0G6mL4WnldR+jNe6hqZ
         49CWYRcU+i6/yeIlkoaUJHf8If27HP3yxCp1RIFujCmNwG6iQDclcDgu5Z3J0Rify1YF
         7+NXHxmIZY4LCECev6AyXe+A9mvkpJZT6ICdilOHH9hOoweqabREISYrmYoLlDKaWyYu
         Z0PTtyGVWX81b+Uj+Cr/BAA1PONREQEgjsP2VBy4roSlAVRqZ6aqW7vvf9q4m5ETArWy
         fYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dg4wwNlM3UA8oFWJ+eNd0CyqfAcH8r5+f9d3B+KbHLw=;
        b=m3RQy61KWf6DddYwIcmHYuEDCphTN0icerWKipwNAhFOvZzTacEweFZiM+e7PdiRJK
         HgNfXgymSnt1wDP4ycFwJGCBDEIbrtfRSH0Frz5AwPkLMWPXiWbeAdeiyJQWVdvc0XoH
         DIKENoLlJV5n0X4LVMUjkljLVw9Ji/gjvT7EwR+bbTra9+N6Rzn+sB5LtbaFLbhDrMBN
         Hnv65GiQ7+YJbkaCrFJ9uaNDtiDtAM0alsuJujmblOu6ZFBjzG2w6Cm3XWbmR7PdRUL3
         xVTh3YITDXpGdcITUV8euHdLRKCNpd+2fkoFXmK4M0c5i3jMZmncFWFMw5mA7W6A8w8S
         KJHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VL3QrELr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 190si21079455ybf.2.2020.08.18.08.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 08:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VL3QrELr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k83Qt-0000es-Q5
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 11:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k82hF-0005S7-FR
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:34:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46284
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k82hC-0002Wj-3q
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 10:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597761277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dg4wwNlM3UA8oFWJ+eNd0CyqfAcH8r5+f9d3B+KbHLw=;
 b=VL3QrELrr3P3LRa7aUHML6IRIzPjOyHbIVG+KiF0sszw2Txr5nhBAwakjdZC1HkRMffpBh
 L3oyVm8iLK7YHM/ZCcKnggOiny4eg8ni4Zfl18JpD89+pm71jl6yu/OoEMoHkCdmm/ctiC
 onAUUB2+E1mhVDhieRYnErizjAbO7hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-Tvo8x58pOMWIWCKJsuH7Ng-1; Tue, 18 Aug 2020 10:34:30 -0400
X-MC-Unique: Tvo8x58pOMWIWCKJsuH7Ng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D04C08DFFEB;
 Tue, 18 Aug 2020 14:34:16 +0000 (UTC)
Received: from localhost (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B6445C70A;
 Tue, 18 Aug 2020 14:34:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 7/7] vhost-user-blk-pci: default num_queues to -smp N
Date: Tue, 18 Aug 2020 15:33:48 +0100
Message-Id: <20200818143348.310613-8-stefanha@redhat.com>
In-Reply-To: <20200818143348.310613-1-stefanha@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 06:40:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, cohuck@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eOs9kQPBLPqN

QXV0b21hdGljYWxseSBzaXplIHRoZSBudW1iZXIgb2YgcmVxdWVzdCB2aXJ0cXVldWVzIHRvIG1h
dGNoIHRoZSBudW1iZXIKb2YgdkNQVXMuICBUaGlzIGVuc3VyZXMgdGhhdCBjb21wbGV0aW9uIGlu
dGVycnVwdHMgYXJlIGhhbmRsZWQgb24gdGhlCnNhbWUgdkNQVSB0aGF0IHN1Ym1pdHRlZCB0aGUg
cmVxdWVzdC4gIE5vIElQSSBpcyBuZWNlc3NhcnkgdG8gY29tcGxldGUKYW4gSS9PIHJlcXVlc3Qg
YW5kIHBlcmZvcm1hbmNlIGlzIGltcHJvdmVkLiAgVGhlIG1heGltdW0gbnVtYmVyIG9mIE1TSS1Y
CnZlY3RvcnMgYW5kIHZpcnRxdWV1ZXMgbGltaXQgYXJlIHJlc3BlY3RlZC4KClNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IENv
cm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUmFwaGFlbCBOb3J3
aXR6IDxyYXBoYWVsLm5vcndpdHpAbnV0YW5peC5jb20+Ci0tLQogaW5jbHVkZS9ody92aXJ0aW8v
dmhvc3QtdXNlci1ibGsuaCB8IDIgKysKIGh3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMgICAgICAg
ICAgfCA2ICsrKysrLQogaHcvY29yZS9tYWNoaW5lLmMgICAgICAgICAgICAgICAgICB8IDEgKwog
aHcvdmlydGlvL3Zob3N0LXVzZXItYmxrLXBjaS5jICAgICB8IDQgKysrKwogNCBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody92aXJ0aW8vdmhvc3QtdXNlci1ibGsuaCBiL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LXVz
ZXItYmxrLmgKaW5kZXggMzRhZDZmMGMwZS4uMjkyZDE3MTQ3YyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9ody92aXJ0aW8vdmhvc3QtdXNlci1ibGsuaAorKysgYi9pbmNsdWRlL2h3L3ZpcnRpby92aG9z
dC11c2VyLWJsay5oCkBAIC0yNSw2ICsyNSw4IEBACiAjZGVmaW5lIFZIT1NUX1VTRVJfQkxLKG9i
aikgXAogICAgICAgICBPQkpFQ1RfQ0hFQ0soVkhvc3RVc2VyQmxrLCAob2JqKSwgVFlQRV9WSE9T
VF9VU0VSX0JMSykKIAorI2RlZmluZSBWSE9TVF9VU0VSX0JMS19BVVRPX05VTV9RVUVVRVMgVUlO
VDE2X01BWAorCiB0eXBlZGVmIHN0cnVjdCBWSG9zdFVzZXJCbGsgewogICAgIFZpcnRJT0Rldmlj
ZSBwYXJlbnRfb2JqOwogICAgIENoYXJCYWNrZW5kIGNoYXJkZXY7CmRpZmYgLS1naXQgYS9ody9i
bG9jay92aG9zdC11c2VyLWJsay5jIGIvaHcvYmxvY2svdmhvc3QtdXNlci1ibGsuYwppbmRleCBh
MDBiODU0NzM2Li4zOWFlYzQyZGFlIDEwMDY0NAotLS0gYS9ody9ibG9jay92aG9zdC11c2VyLWJs
ay5jCisrKyBiL2h3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMKQEAgLTQyMCw2ICs0MjAsOSBAQCBz
dGF0aWMgdm9pZCB2aG9zdF91c2VyX2Jsa19kZXZpY2VfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2
LCBFcnJvciAqKmVycnApCiAgICAgICAgIHJldHVybjsKICAgICB9CiAKKyAgICBpZiAocy0+bnVt
X3F1ZXVlcyA9PSBWSE9TVF9VU0VSX0JMS19BVVRPX05VTV9RVUVVRVMpIHsKKyAgICAgICAgcy0+
bnVtX3F1ZXVlcyA9IDE7CisgICAgfQogICAgIGlmICghcy0+bnVtX3F1ZXVlcyB8fCBzLT5udW1f
cXVldWVzID4gVklSVElPX1FVRVVFX01BWCkgewogICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJ2
aG9zdC11c2VyLWJsazogaW52YWxpZCBudW1iZXIgb2YgSU8gcXVldWVzIik7CiAgICAgICAgIHJl
dHVybjsKQEAgLTUzMSw3ICs1MzQsOCBAQCBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9u
IHZtc3RhdGVfdmhvc3RfdXNlcl9ibGsgPSB7CiAKIHN0YXRpYyBQcm9wZXJ0eSB2aG9zdF91c2Vy
X2Jsa19wcm9wZXJ0aWVzW10gPSB7CiAgICAgREVGSU5FX1BST1BfQ0hSKCJjaGFyZGV2IiwgVkhv
c3RVc2VyQmxrLCBjaGFyZGV2KSwKLSAgICBERUZJTkVfUFJPUF9VSU5UMTYoIm51bS1xdWV1ZXMi
LCBWSG9zdFVzZXJCbGssIG51bV9xdWV1ZXMsIDEpLAorICAgIERFRklORV9QUk9QX1VJTlQxNigi
bnVtLXF1ZXVlcyIsIFZIb3N0VXNlckJsaywgbnVtX3F1ZXVlcywKKyAgICAgICAgICAgICAgICAg
ICAgICAgVkhPU1RfVVNFUl9CTEtfQVVUT19OVU1fUVVFVUVTKSwKICAgICBERUZJTkVfUFJPUF9V
SU5UMzIoInF1ZXVlLXNpemUiLCBWSG9zdFVzZXJCbGssIHF1ZXVlX3NpemUsIDEyOCksCiAgICAg
REVGSU5FX1BST1BfQklUKCJjb25maWctd2NlIiwgVkhvc3RVc2VyQmxrLCBjb25maWdfd2NlLCAw
LCB0cnVlKSwKICAgICBERUZJTkVfUFJPUF9FTkRfT0ZfTElTVCgpLApkaWZmIC0tZ2l0IGEvaHcv
Y29yZS9tYWNoaW5lLmMgYi9ody9jb3JlL21hY2hpbmUuYwppbmRleCA3ZjY1ZmE4NzQzLi5lYTI2
ZDYxMjM3IDEwMDY0NAotLS0gYS9ody9jb3JlL21hY2hpbmUuYworKysgYi9ody9jb3JlL21hY2hp
bmUuYwpAQCAtMzAsNiArMzAsNyBAQAogCiBHbG9iYWxQcm9wZXJ0eSBod19jb21wYXRfNV8xW10g
PSB7CiAgICAgeyAidmhvc3Qtc2NzaSIsICJudW1fcXVldWVzIiwgIjEifSwKKyAgICB7ICJ2aG9z
dC11c2VyLWJsayIsICJudW0tcXVldWVzIiwgIjEifSwKICAgICB7ICJ2aG9zdC11c2VyLXNjc2ki
LCAibnVtX3F1ZXVlcyIsICIxIn0sCiAgICAgeyAidmlydGlvLWJsay1kZXZpY2UiLCAibnVtLXF1
ZXVlcyIsICIxIn0sCiAgICAgeyAidmlydGlvLXNjc2ktZGV2aWNlIiwgIm51bV9xdWV1ZXMiLCAi
MSJ9LApkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3Zob3N0LXVzZXItYmxrLXBjaS5jIGIvaHcvdmly
dGlvL3Zob3N0LXVzZXItYmxrLXBjaS5jCmluZGV4IDRmNWQ1Y2JmNDQuLmE2MmE3MWUwNjcgMTAw
NjQ0Ci0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLWJsay1wY2kuYworKysgYi9ody92aXJ0aW8v
dmhvc3QtdXNlci1ibGstcGNpLmMKQEAgLTU0LDYgKzU0LDEwIEBAIHN0YXRpYyB2b2lkIHZob3N0
X3VzZXJfYmxrX3BjaV9yZWFsaXplKFZpcnRJT1BDSVByb3h5ICp2cGNpX2RldiwgRXJyb3IgKipl
cnJwKQogICAgIFZIb3N0VXNlckJsa1BDSSAqZGV2ID0gVkhPU1RfVVNFUl9CTEtfUENJKHZwY2lf
ZGV2KTsKICAgICBEZXZpY2VTdGF0ZSAqdmRldiA9IERFVklDRSgmZGV2LT52ZGV2KTsKIAorICAg
IGlmIChkZXYtPnZkZXYubnVtX3F1ZXVlcyA9PSBWSE9TVF9VU0VSX0JMS19BVVRPX05VTV9RVUVV
RVMpIHsKKyAgICAgICAgZGV2LT52ZGV2Lm51bV9xdWV1ZXMgPSB2aXJ0aW9fcGNpX29wdGltYWxf
bnVtX3F1ZXVlcygwKTsKKyAgICB9CisKICAgICBpZiAodnBjaV9kZXYtPm52ZWN0b3JzID09IERF
Vl9OVkVDVE9SU19VTlNQRUNJRklFRCkgewogICAgICAgICB2cGNpX2Rldi0+bnZlY3RvcnMgPSBk
ZXYtPnZkZXYubnVtX3F1ZXVlcyArIDE7CiAgICAgfQotLSAKMi4yNi4yCgo=


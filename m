Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4050284wrx;
        Mon, 25 Mar 2019 09:24:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/8s8Wxl1HYF1mLnyXOSxnbnGZ+S7cFtbtsyMT5C5FZulDH0CRM6p6Uv2MtEgMhjvoP5p9
X-Received: by 2002:a81:1a4d:: with SMTP id a74mr21901620ywa.111.1553531086153;
        Mon, 25 Mar 2019 09:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553531086; cv=none;
        d=google.com; s=arc-20160816;
        b=taCy89mFA3cbvaMSA9Ry8ek29Z8UeE0kXHpUrV0wkDtMOqFBO+YQbINNz93Hk6g1W0
         YTqX4SuJXrgluf2bshh6YiQuoycPcx9vM6xaQmT4inE71ISsKYodXCtLaXSCMiCmmPfk
         D5XHry84yRzNm2ilguIW/ipr4j+65jktWQ2gOa9TCzHi5/MOTwdOetcYw8gryA0eG5Tl
         49qDsltG+Vah2j58ODciF37BtD4odywx1xhv3xzuC4pGIBPBFvU8MxZRWnRz2CCY1ehI
         sOEa7PfUfwFMlJf6XG5zUTl/dsikOBm01RtmbTUU7wrOC/HyfHm6mJRi6L+7gA9/Zb5D
         lR9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=AKIerRAryfZ0xe03fClpICYYw7FK7G3gAmvDNpxkA4o=;
        b=PwHscZirs8c31R5SHRPzNezHFjS+7wiIH7eBNMew8cjH714g/EVnH6G8g1iPj4CR4s
         uXRxydyin8cHEQ7G3pHFyOz0gz/W9HW2VLO36Ud5oQ9GKy0utHD6lC9zXGjdsJd85KoZ
         dR+OKulIC+UsOwu4iTaL1pCudDRJyK4gnLTk64j8yq3KzSikYCycthCsj8MuAgbU9ybx
         eMUr9BicAO6XddyX8CV41SUEXAcwAN4bjYL+nN2h5PvBsi0OAnTp1JqhNT+RRqBgz9BU
         m5/rOHIOQ521csrOYD/U098oWNQnP/BtyYykX+oosU/G684hlrsHKMK2EANw+lGerWKQ
         TgVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si9471480ybb.164.2019.03.25.09.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SOz-0001zm-AB
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:24:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGZ-0004EC-0I
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:16:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S1x-0005i6-G9
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 12:01:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S1U-0005VP-Lr; Mon, 25 Mar 2019 12:00:29 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 859223091786;
	Mon, 25 Mar 2019 16:00:27 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F3C364294;
	Mon, 25 Mar 2019 16:00:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:54 +0000
Message-Id: <20190325155857.10661-5-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 25 Mar 2019 16:00:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/7] trace-events: Shorten file names in comments
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul.durrant@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X8YJQJGvYfPk

From: Markus Armbruster <armbru@redhat.com>

We spell out sub/dir/ in sub/dir/trace-events' comments pointing to
source files.  That's because when trace-events got split up, the
comments were moved verbatim.

Delete the sub/dir/ part from these comments.  Gets rid of several
misspellings.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190314180929.27722-3-armbru@redhat.com
Message-Id: <20190314180929.27722-3-armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 audio/trace-events              |  6 ++---
 authz/trace-events              | 10 +++----
 block/trace-events              | 48 ++++++++++++++++-----------------
 chardev/trace-events            |  4 +--
 crypto/trace-events             | 10 +++----
 hw/9pfs/trace-events            |  2 +-
 hw/acpi/trace-events            |  6 ++---
 hw/alpha/trace-events           |  2 +-
 hw/arm/trace-events             |  6 ++---
 hw/audio/trace-events           |  6 ++---
 hw/block/dataplane/trace-events |  2 +-
 hw/block/trace-events           | 12 ++++-----
 hw/char/trace-events            | 24 ++++++++---------
 hw/display/trace-events         | 26 +++++++++---------
 hw/dma/trace-events             |  6 ++---
 hw/gpio/trace-events            |  2 +-
 hw/hppa/trace-events            |  2 +-
 hw/i2c/trace-events             |  2 +-
 hw/i386/trace-events            |  8 +++---
 hw/i386/xen/trace-events        |  4 +--
 hw/ide/trace-events             | 16 +++++------
 hw/input/trace-events           | 16 +++++------
 hw/intc/trace-events            | 34 +++++++++++------------
 hw/isa/trace-events             |  4 +--
 hw/mem/trace-events             |  4 +--
 hw/misc/macio/trace-events      |  8 +++---
 hw/misc/trace-events            | 36 ++++++++++++-------------
 hw/net/trace-events             | 34 +++++++++++------------
 hw/nvram/trace-events           |  4 +--
 hw/pci-host/trace-events        |  6 ++---
 hw/pci/trace-events             |  6 ++---
 hw/ppc/trace-events             | 28 +++++++++----------
 hw/rdma/trace-events            |  6 ++---
 hw/rdma/vmw/trace-events        |  8 +++---
 hw/s390x/trace-events           |  4 +--
 hw/scsi/trace-events            | 22 +++++++--------
 hw/sd/trace-events              | 12 ++++-----
 hw/sparc/trace-events           |  6 ++---
 hw/sparc64/trace-events         |  6 ++---
 hw/timer/trace-events           | 24 ++++++++---------
 hw/tpm/trace-events             | 12 ++++-----
 hw/usb/trace-events             | 22 +++++++--------
 hw/vfio/trace-events            | 12 ++++-----
 hw/virtio/trace-events          | 10 +++----
 hw/watchdog/trace-events        |  2 +-
 hw/xen/trace-events             |  6 ++---
 io/trace-events                 | 12 ++++-----
 linux-user/trace-events         |  2 +-
 migration/trace-events          | 26 +++++++++---------
 nbd/trace-events                |  6 ++---
 net/trace-events                | 10 +++----
 qapi/trace-events               |  2 +-
 qom/trace-events                |  2 +-
 scsi/trace-events               |  2 +-
 target/arm/trace-events         |  4 +--
 target/hppa/trace-events        |  4 +--
 target/i386/trace-events        |  4 +--
 target/mips/trace-events        |  2 +-
 target/ppc/trace-events         |  2 +-
 target/s390x/trace-events       | 10 +++----
 target/sparc/trace-events       |  8 +++---
 ui/trace-events                 | 14 +++++-----
 util/trace-events               | 26 +++++++++---------
 63 files changed, 336 insertions(+), 336 deletions(-)

diff --git a/audio/trace-events b/audio/trace-events
index c986469319..a1d1eccb8a 100644
--- a/audio/trace-events
+++ b/audio/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# audio/alsaaudio.c
+# alsaaudio.c
 alsa_revents(int revents) "revents =3D %d"
 alsa_pollout(int i, int fd) "i =3D %d fd =3D %d"
 alsa_set_handler(int events, int index, int fd, int err) "events=3D0x%x =
index=3D%d fd=3D%d err=3D%d"
@@ -12,11 +12,11 @@ alsa_resume_out(void) "Resuming suspended output stre=
am"
 alsa_resume_in(void) "Resuming suspended input stream"
 alsa_no_frames(int state) "No frames available and ALSA state is %d"
=20
-# audio/ossaudio.c
+# ossaudio.c
 oss_version(int version) "OSS version =3D 0x%x"
 oss_invalid_available_size(int size, int bufsize) "Invalid available siz=
e, size=3D%d bufsize=3D%d"
=20
-# audio/audio.c
+# audio.c
 audio_timer_start(int interval) "interval %d ms"
 audio_timer_stop(void) ""
 audio_timer_delayed(int interval) "interval %d ms"
diff --git a/authz/trace-events b/authz/trace-events
index 72c411927d..5cb577061c 100644
--- a/authz/trace-events
+++ b/authz/trace-events
@@ -1,18 +1,18 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# authz/base.c
+# base.c
 qauthz_is_allowed(void *authz, const char *identity, bool allowed) "Auth=
Z %p check identity=3D%s allowed=3D%d"
=20
-# auth/simple.c
+# simple.c
 qauthz_simple_is_allowed(void *authz, const char *wantidentity, const ch=
ar *gotidentity) "AuthZ simple %p check want identity=3D%s got identity=3D=
%s"
=20
-# auth/list.c
+# list.c
 qauthz_list_check_rule(void *authz, const char *identity, const char *ru=
le, int format, int policy) "AuthZ list %p check rule=3D%s identity=3D%s =
format=3D%d policy=3D%d"
 qauthz_list_default_policy(void *authz, const char *identity, int policy=
) "AuthZ list %p default identity=3D%s policy=3D%d"
=20
-# auth/listfile.c
+# listfile.c
 qauthz_list_file_load(void *authz, const char *filename) "AuthZ file %p =
load filename=3D%s"
 qauthz_list_file_refresh(void *authz, const char *filename, int success)=
 "AuthZ file %p load filename=3D%s success=3D%d"
=20
-# auth/pam.c
+# pam.c
 qauthz_pam_check(void *authz, const char *identity, const char *service)=
 "AuthZ PAM %p identity=3D%s service=3D%s"
diff --git a/block/trace-events b/block/trace-events
index 70056eafd2..28b6364f28 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -1,16 +1,16 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# block.c
+# ../block.c
 bdrv_open_common(void *bs, const char *filename, int flags, const char *=
format_name) "bs %p filename \"%s\" flags 0x%x format_name \"%s\""
 bdrv_lock_medium(void *bs, bool locked) "bs %p locked %d"
=20
-# block/block-backend.c
+# block-backend.c
 blk_co_preadv(void *blk, void *bs, int64_t offset, unsigned int bytes, i=
nt flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
 blk_co_pwritev(void *blk, void *bs, int64_t offset, unsigned int bytes, =
int flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
 blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p=
"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p=
"
=20
-# block/io.c
+# io.c
 bdrv_co_preadv(void *bs, int64_t offset, int64_t nbytes, unsigned int fl=
ags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
 bdrv_co_pwritev(void *bs, int64_t offset, int64_t nbytes, unsigned int f=
lags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
 bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int count, int flags) "b=
s %p offset %"PRId64" count %d flags 0x%x"
@@ -18,15 +18,15 @@ bdrv_co_do_copy_on_readv(void *bs, int64_t offset, un=
signed int bytes, int64_t c
 bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint6=
4_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p =
offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x=
%x"
 bdrv_co_copy_range_to(void *src, uint64_t src_offset, void *dst, uint64_=
t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p of=
fset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x=
"
=20
-# block/stream.c
+# stream.c
 stream_one_iteration(void *s, int64_t offset, uint64_t bytes, int is_all=
ocated) "s %p offset %" PRId64 " bytes %" PRIu64 " is_allocated %d"
 stream_start(void *bs, void *base, void *s) "bs %p base %p s %p"
=20
-# block/commit.c
+# commit.c
 commit_one_iteration(void *s, int64_t offset, uint64_t bytes, int is_all=
ocated) "s %p offset %" PRId64 " bytes %" PRIu64 " is_allocated %d"
 commit_start(void *bs, void *base, void *top, void *s) "bs %p base %p to=
p %p s %p"
=20
-# block/mirror.c
+# mirror.c
 mirror_start(void *bs, void *s, void *opaque) "bs %p s %p opaque %p"
 mirror_restart_iter(void *s, int64_t cnt) "s %p dirty count %"PRId64
 mirror_before_flush(void *s) "s %p"
@@ -37,7 +37,7 @@ mirror_iteration_done(void *s, int64_t offset, uint64_t=
 bytes, int ret) "s %p of
 mirror_yield(void *s, int64_t cnt, int buf_free_count, int in_flight) "s=
 %p dirty count %"PRId64" free buffers %d in_flight %d"
 mirror_yield_in_flight(void *s, int64_t offset, int in_flight) "s %p off=
set %" PRId64 " in_flight %d"
=20
-# block/backup.c
+# backup.c
 backup_do_cow_enter(void *job, int64_t start, int64_t offset, uint64_t b=
ytes) "job %p start %" PRId64 " offset %" PRId64 " bytes %" PRIu64
 backup_do_cow_return(void *job, int64_t offset, uint64_t bytes, int ret)=
 "job %p offset %" PRId64 " bytes %" PRIu64 " ret %d"
 backup_do_cow_skip(void *job, int64_t start) "job %p start %"PRId64
@@ -46,7 +46,7 @@ backup_do_cow_read_fail(void *job, int64_t start, int r=
et) "job %p start %"PRId6
 backup_do_cow_write_fail(void *job, int64_t start, int ret) "job %p star=
t %"PRId64" ret %d"
 backup_do_cow_copy_range_fail(void *job, int64_t start, int ret) "job %p=
 start %"PRId64" ret %d"
=20
-# blockdev.c
+# ../blockdev.c
 qmp_block_job_cancel(void *job) "job %p"
 qmp_block_job_pause(void *job) "job %p"
 qmp_block_job_resume(void *job) "job %p"
@@ -55,13 +55,13 @@ qmp_block_job_finalize(void *job) "job %p"
 qmp_block_job_dismiss(void *job) "job %p"
 qmp_block_stream(void *bs, void *job) "bs %p job %p"
=20
-# block/file-win32.c
-# block/file-posix.c
+# file-posix.c
+# file-win32.c
 file_paio_submit_co(int64_t offset, int count, int type) "offset %"PRId6=
4" count %d type %d"
 file_paio_submit(void *acb, void *opaque, int64_t offset, int count, int=
 type) "acb %p opaque %p offset %"PRId64" count %d type %d"
 file_copy_file_range(void *bs, int src, int64_t src_off, int dst, int64_=
t dst_off, int64_t bytes, int flags, int64_t ret) "bs %p src_fd %d offset=
 %"PRIu64" dst_fd %d offset %"PRIu64" bytes %"PRIu64" flags %d ret %"PRId=
64
=20
-# block/qcow2.c
+# qcow2.c
 qcow2_writev_start_req(void *co, int64_t offset, int bytes) "co %p offse=
t 0x%" PRIx64 " bytes %d"
 qcow2_writev_done_req(void *co, int ret) "co %p ret %d"
 qcow2_writev_start_part(void *co) "co %p"
@@ -70,7 +70,7 @@ qcow2_writev_data(void *co, uint64_t offset) "co %p off=
set 0x%" PRIx64
 qcow2_pwrite_zeroes_start_req(void *co, int64_t offset, int count) "co %=
p offset 0x%" PRIx64 " count %d"
 qcow2_pwrite_zeroes(void *co, int64_t offset, int count) "co %p offset 0=
x%" PRIx64 " count %d"
=20
-# block/qcow2-cluster.c
+# qcow2-cluster.c
 qcow2_alloc_clusters_offset(void *co, uint64_t offset, int bytes) "co %p=
 offset 0x%" PRIx64 " bytes %d"
 qcow2_handle_copied(void *co, uint64_t guest_offset, uint64_t host_offse=
t, uint64_t bytes) "co %p guest_offset 0x%" PRIx64 " host_offset 0x%" PRI=
x64 " bytes 0x%" PRIx64
 qcow2_handle_alloc(void *co, uint64_t guest_offset, uint64_t host_offset=
, uint64_t bytes) "co %p guest_offset 0x%" PRIx64 " host_offset 0x%" PRIx=
64 " bytes 0x%" PRIx64
@@ -84,7 +84,7 @@ qcow2_l2_allocate_write_l2(void *bs, int l1_index) "bs =
%p l1_index %d"
 qcow2_l2_allocate_write_l1(void *bs, int l1_index) "bs %p l1_index %d"
 qcow2_l2_allocate_done(void *bs, int l1_index, int ret) "bs %p l1_index =
%d ret %d"
=20
-# block/qcow2-cache.c
+# qcow2-cache.c
 qcow2_cache_get(void *co, int c, uint64_t offset, bool read_from_disk) "=
co %p is_l2_cache %d offset 0x%" PRIx64 " read_from_disk %d"
 qcow2_cache_get_replace_entry(void *co, int c, int i) "co %p is_l2_cache=
 %d index %d"
 qcow2_cache_get_read(void *co, int c, int i) "co %p is_l2_cache %d index=
 %d"
@@ -92,18 +92,18 @@ qcow2_cache_get_done(void *co, int c, int i) "co %p i=
s_l2_cache %d index %d"
 qcow2_cache_flush(void *co, int c) "co %p is_l2_cache %d"
 qcow2_cache_entry_flush(void *co, int c, int i) "co %p is_l2_cache %d in=
dex %d"
=20
-# block/qed-l2-cache.c
+# qed-l2-cache.c
 qed_alloc_l2_cache_entry(void *l2_cache, void *entry) "l2_cache %p entry=
 %p"
 qed_unref_l2_cache_entry(void *entry, int ref) "entry %p ref %d"
 qed_find_l2_cache_entry(void *l2_cache, void *entry, uint64_t offset, in=
t ref) "l2_cache %p entry %p offset %"PRIu64" ref %d"
=20
-# block/qed-table.c
+# qed-table.c
 qed_read_table(void *s, uint64_t offset, void *table) "s %p offset %"PRI=
u64" table %p"
 qed_read_table_cb(void *s, void *table, int ret) "s %p table %p ret %d"
 qed_write_table(void *s, uint64_t offset, void *table, unsigned int inde=
x, unsigned int n) "s %p offset %"PRIu64" table %p index %u n %u"
 qed_write_table_cb(void *s, void *table, int flush, int ret) "s %p table=
 %p flush %d ret %d"
=20
-# block/qed.c
+# qed.c
 qed_need_check_timer_cb(void *s) "s %p"
 qed_start_need_check_timer(void *s) "s %p"
 qed_cancel_need_check_timer(void *s) "s %p"
@@ -116,7 +116,7 @@ qed_aio_write_prefill(void *s, void *acb, uint64_t st=
art, size_t len, uint64_t o
 qed_aio_write_postfill(void *s, void *acb, uint64_t start, size_t len, u=
int64_t offset) "s %p acb %p start %"PRIu64" len %zu offset %"PRIu64
 qed_aio_write_main(void *s, void *acb, int ret, uint64_t offset, size_t =
len) "s %p acb %p ret %d offset %"PRIu64" len %zu"
=20
-# block/vxhs.c
+# vxhs.c
 vxhs_iio_callback(int error) "ctx is NULL: error %d"
 vxhs_iio_callback_chnfail(int err, int error) "QNIO channel failed, no i=
/o %d, %d"
 vxhs_iio_callback_unknwn(int opcode, int err) "unexpected opcode %d, err=
no %d"
@@ -133,7 +133,7 @@ vxhs_parse_uri_hostinfo(char *host, int port) "Host: =
IP %s, Port %d"
 vxhs_close(char *vdisk_guid) "Closing vdisk %s"
 vxhs_get_creds(const char *cacert, const char *client_key, const char *c=
lient_cert) "cacert %s, client_key %s, client_cert %s"
=20
-# block/nvme.c
+# nvme.c
 nvme_kick(void *s, int queue) "s %p queue %d"
 nvme_dma_flush_queue_wait(void *s) "s %p"
 nvme_error(int cmd_specific, int sq_head, int sqid, int cid, int status)=
 "cmd_specific %d sq_head %d sqid %d cid %d status 0x%x"
@@ -154,14 +154,14 @@ nvme_cmd_map_qiov(void *s, void *cmd, void *req, vo=
id *qiov, int entries) "s %p
 nvme_cmd_map_qiov_pages(void *s, int i, uint64_t page) "s %p page[%d] 0x=
%"PRIx64
 nvme_cmd_map_qiov_iov(void *s, int i, void *page, int pages) "s %p iov[%=
d] %p pages %d"
=20
-# block/iscsi.c
+# iscsi.c
 iscsi_xcopy(void *src_lun, uint64_t src_off, void *dst_lun, uint64_t dst=
_off, uint64_t bytes, int ret) "src_lun %p offset %"PRIu64" dst_lun %p of=
fset %"PRIu64" bytes %"PRIu64" ret %d"
=20
-# block/nbd-client.c
+# nbd-client.c
 nbd_read_reply_entry_fail(int ret, const char *err) "ret =3D %d, err: %s=
"
 nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16=
_t flags, uint16_t type, const char *name, int ret, const char *err) "Req=
uest failed { .from =3D %" PRIu64", .len =3D %" PRIu32 ", .handle =3D %" =
PRIu64 ", .flags =3D 0x%" PRIx16 ", .type =3D %" PRIu16 " (%s) } ret =3D =
%d, err: %s"
=20
-# block/ssh.c
+# ssh.c
 ssh_restart_coroutine(void *co) "co=3D%p"
 ssh_flush(void) "fsync"
 ssh_check_host_key_knownhosts(const char *key) "host key OK: %s"
@@ -178,7 +178,7 @@ ssh_write_buf(void *buf, size_t size) "sftp_write buf=
=3D%p size=3D%zu"
 ssh_write_return(ssize_t ret) "sftp_write returned %zd"
 ssh_seek(int64_t offset) "seeking to offset=3D%" PRIi64
=20
-# block/curl.c
+# curl.c
 curl_timer_cb(long timeout_ms) "timer callback timeout_ms %ld"
 curl_sock_cb(int action, int fd) "sock action %d on fd %d"
 curl_read_cb(size_t realsize) "just reading %zu bytes"
@@ -187,14 +187,14 @@ curl_open_size(uint64_t size) "size =3D %" PRIu64
 curl_setup_preadv(uint64_t bytes, uint64_t start, const char *range) "re=
ading %" PRIu64 " at %" PRIu64 " (%s)"
 curl_close(void) "close"
=20
-# block/file-posix.c
+# file-posix.c
 file_xfs_write_zeroes(const char *error) "cannot write zero range (%s)"
 file_xfs_discard(const char *error) "cannot punch hole (%s)"
 file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
 file_setup_cdrom(const char *partition) "Using %s as optical disc"
 file_hdev_is_sg(int type, int version) "SG device found: type=3D%d, vers=
ion=3D%d"
=20
-# block/sheepdog.c
+# sheepdog.c
 sheepdog_reconnect_to_sdog(void) "Wait for connection to be established"
 sheepdog_aio_read_response(void) "disable cache since the server doesn't=
 support it"
 sheepdog_open(uint32_t vid) "0x%" PRIx32 " snapshot inode was open"
diff --git a/chardev/trace-events b/chardev/trace-events
index b8a7596344..5ea4408207 100644
--- a/chardev/trace-events
+++ b/chardev/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# chardev/wctablet.c
+# wctablet.c
 wct_init(void) ""
 wct_cmd_re(void) ""
 wct_cmd_st(void) ""
@@ -9,7 +9,7 @@ wct_cmd_ts(int input) "0x%02x"
 wct_cmd_other(const char *cmd) "%s"
 wct_speed(int speed) "%d"
=20
-# chardev/spice.c
+# spice.c
 spice_chr_discard_write(int len) "spice chr write discarded %d"
 spice_vmc_write(ssize_t out, int len) "spice wrote %zd of requested %d"
 spice_vmc_read(int bytes, int len) "spice read %d of requested %d"
diff --git a/crypto/trace-events b/crypto/trace-events
index a38ad7b787..9e594d30e8 100644
--- a/crypto/trace-events
+++ b/crypto/trace-events
@@ -1,16 +1,16 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# crypto/tlscreds.c
+# tlscreds.c
 qcrypto_tls_creds_load_dh(void *creds, const char *filename) "TLS creds =
load DH creds=3D%p filename=3D%s"
 qcrypto_tls_creds_get_path(void *creds, const char *filename, const char=
 *path) "TLS creds path creds=3D%p filename=3D%s path=3D%s"
=20
-# crypto/tlscredsanon.c
+# tlscredsanon.c
 qcrypto_tls_creds_anon_load(void *creds, const char *dir) "TLS creds ano=
n load creds=3D%p dir=3D%s"
=20
-# crypto/tlscredspsk.c
+# tlscredspsk.c
 qcrypto_tls_creds_psk_load(void *creds, const char *dir) "TLS creds psk =
load creds=3D%p dir=3D%s"
=20
-# crypto/tlscredsx509.c
+# tlscredsx509.c
 qcrypto_tls_creds_x509_load(void *creds, const char *dir) "TLS creds x50=
9 load creds=3D%p dir=3D%s"
 qcrypto_tls_creds_x509_check_basic_constraints(void *creds, const char *=
file, int status) "TLS creds x509 check basic constraints creds=3D%p file=
=3D%s status=3D%d"
 qcrypto_tls_creds_x509_check_key_usage(void *creds, const char *file, in=
t status, int usage, int critical) "TLS creds x509 check key usage creds=3D=
%p file=3D%s status=3D%d usage=3D%d critical=3D%d"
@@ -18,6 +18,6 @@ qcrypto_tls_creds_x509_check_key_purpose(void *creds, c=
onst char *file, int stat
 qcrypto_tls_creds_x509_load_cert(void *creds, int isServer, const char *=
file) "TLS creds x509 load cert creds=3D%p isServer=3D%d file=3D%s"
 qcrypto_tls_creds_x509_load_cert_list(void *creds, const char *file) "TL=
S creds x509 load cert list creds=3D%p file=3D%s"
=20
-# crypto/tlssession.c
+# tlssession.c
 qcrypto_tls_session_new(void *session, void *creds, const char *hostname=
, const char *authzid, int endpoint) "TLS session new session=3D%p creds=3D=
%p hostname=3D%s authzid=3D%s endpoint=3D%d"
 qcrypto_tls_session_check_creds(void *session, const char *status) "TLS =
session check creds session=3D%p status=3D%s"
diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
index 881e4c4dd8..0c14bda178 100644
--- a/hw/9pfs/trace-events
+++ b/hw/9pfs/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/9pfs/virtio-9p.c
+# virtio-9p.c
 v9fs_rcancel(uint16_t tag, uint8_t id) "tag %d id %d"
 v9fs_rerror(uint16_t tag, uint8_t id, int err) "tag %d id %d err %d"
 v9fs_version(uint16_t tag, uint8_t id, int32_t msize, char* version) "ta=
g %d id %d msize %d version %s"
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index df0024f8b2..6272d8a9e7 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/acpi/memory_hotplug.c
+# memory_hotplug.c
 mhp_acpi_invalid_slot_selected(uint32_t slot) "0x%"PRIx32
 mhp_acpi_ejecting_invalid_slot(uint32_t slot) "0x%"PRIx32
 mhp_acpi_read_addr_lo(uint32_t slot, uint32_t addr) "slot[0x%"PRIx32"] a=
ddr lo: 0x%"PRIx32
@@ -17,7 +17,7 @@ mhp_acpi_clear_remove_evt(uint32_t slot) "slot[0x%"PRIx=
32"] clear remove event"
 mhp_acpi_pc_dimm_deleted(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm delet=
ed"
 mhp_acpi_pc_dimm_delete_failed(uint32_t slot) "slot[0x%"PRIx32"] pc-dimm=
 delete failed"
=20
-# hw/acpi/cpu.c
+# cpu.c
 cpuhp_acpi_invalid_idx_selected(uint32_t idx) "0x%"PRIx32
 cpuhp_acpi_read_flags(uint32_t idx, uint8_t flags) "idx[0x%"PRIx32"] fla=
gs: 0x%"PRIx8
 cpuhp_acpi_write_idx(uint32_t idx) "set active cpu idx: 0x%"PRIx32
@@ -31,6 +31,6 @@ cpuhp_acpi_ejecting_cpu(uint32_t idx) "0x%"PRIx32
 cpuhp_acpi_write_ost_ev(uint32_t slot, uint32_t ev) "idx[0x%"PRIx32"] OS=
T EVENT: 0x%"PRIx32
 cpuhp_acpi_write_ost_status(uint32_t slot, uint32_t st) "idx[0x%"PRIx32"=
] OST STATUS: 0x%"PRIx32
=20
-# hw/acpi/tco.c
+# tco.c
 tco_timer_reload(int ticks, int msec) "ticks=3D%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts=
_no=3D%d no_reboot=3D%d/%d"
diff --git a/hw/alpha/trace-events b/hw/alpha/trace-events
index 46024cca0b..5b8315f27f 100644
--- a/hw/alpha/trace-events
+++ b/hw/alpha/trace-events
@@ -1,4 +1,4 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/alpha/pci.c
+# pci.c
 alpha_pci_iack_write(void) ""
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 27b11d655d..3e91ca37a9 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -1,9 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/arm/virt-acpi-build.c
+# virt-acpi-build.c
 virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
=20
-# hw/arm/smmu-common.c
+# smmu-common.c
 smmu_add_mr(const char *name) "%s"
 smmu_page_walk(int stage, uint64_t baseaddr, int first_level, uint64_t s=
tart, uint64_t end) "stage=3D%d, baseaddr=3D0x%"PRIx64", first level=3D%d=
, start=3D0x%"PRIx64", end=3D0x%"PRIx64
 smmu_lookup_table(int level, uint64_t baseaddr, int granule_sz, uint64_t=
 start, uint64_t end, int flags, uint64_t subpage_size) "level=3D%d basea=
ddr=3D0x%"PRIx64" granule=3D%d, start=3D0x%"PRIx64" end=3D0x%"PRIx64" fla=
gs=3D%d subpage_size=3D0x%"PRIx64
@@ -19,7 +19,7 @@ smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate as=
id=3D%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=
=3D%d addr=3D0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=3D%s"
=20
-#hw/arm/smmuv3.c
+# smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r)=
 "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
 smmuv3_trigger_irq(int irq) "irq=3D%d"
 smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=3D0x%x, =
new GERROR=3D0x%x"
diff --git a/hw/audio/trace-events b/hw/audio/trace-events
index 5891b4e2b9..60556b4a97 100644
--- a/hw/audio/trace-events
+++ b/hw/audio/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/audio/cs4231.c
+# cs4231.c
 cs4231_mem_readl_dreg(uint32_t reg, uint32_t ret) "read dreg %d: 0x%02x"
 cs4231_mem_readl_reg(uint32_t reg, uint32_t ret) "read reg %d: 0x%08x"
 cs4231_mem_writel_reg(uint32_t reg, uint32_t old, uint32_t val) "write r=
eg %d: 0x%08x -> 0x%08x"
 cs4231_mem_writel_dreg(uint32_t reg, uint32_t old, uint32_t val) "write =
dreg %d: 0x%02x -> 0x%02x"
=20
-# hw/audio/milkymist-ac97.c
+# milkymist-ac97.c
 milkymist_ac97_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x v=
alue 0x%08x"
 milkymist_ac97_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x =
value 0x%08x"
 milkymist_ac97_pulse_irq_crrequest(void) "Pulse IRQ CR request"
@@ -18,7 +18,7 @@ milkymist_ac97_in_cb_transferred(int transferred) "tran=
sferred %d"
 milkymist_ac97_out_cb(int free, uint32_t remaining) "free %d remaining %=
u"
 milkymist_ac97_out_cb_transferred(int transferred) "transferred %d"
=20
-# hw/audio/hda-codec.c
+# hda-codec.c
 hda_audio_running(const char *stream, int nr, bool running) "st %s, nr %=
d, run %d"
 hda_audio_format(const char *stream, int chan, const char *fmt, int freq=
) "st %s, %d x %s @ %d Hz"
 hda_audio_adjust(const char *stream, int pos) "st %s, pos %d"
diff --git a/hw/block/dataplane/trace-events b/hw/block/dataplane/trace-e=
vents
index 1a7ea277b0..843cc4e7b1 100644
--- a/hw/block/dataplane/trace-events
+++ b/hw/block/dataplane/trace-events
@@ -1,5 +1,5 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/block/dataplane/virtio-blk.c
+# virtio-blk.c
 virtio_blk_data_plane_start(void *s) "dataplane %p"
 virtio_blk_data_plane_stop(void *s) "dataplane %p"
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 8020f9226a..239753c92b 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -1,10 +1,10 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/block/fdc.c
+# fdc.c
 fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
 fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02=
x"
=20
-# hw/block/pflash_cfi0?.c
+# pflash_cfi0?.c
 pflash_reset(void) "reset"
 pflash_read(uint64_t offset, uint8_t cmd, int width, uint8_t wcycle) "of=
fset:0x%04"PRIx64" cmd:0x%02x width:%d wcycle:%u"
 pflash_write(uint64_t offset, uint32_t value, int width, uint8_t wcycle)=
 "offset:0x%04"PRIx64" value:0x%03x width:%d wcycle:%u"
@@ -17,18 +17,18 @@ pflash_manufacturer_id(uint16_t id) "Read Manufacture=
r ID: 0x%04x"
 pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
 pflash_device_info(uint64_t offset) "Read Device Information offset:0x%0=
4"PRIx64
=20
-# hw/block/virtio-blk.c
+# virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req =
%p status %d"
 virtio_blk_rw_complete(void *vdev, void *req, int ret) "vdev %p req %p r=
et %d"
 virtio_blk_handle_write(void *vdev, void *req, uint64_t sector, size_t n=
sectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
 virtio_blk_handle_read(void *vdev, void *req, uint64_t sector, size_t ns=
ectors) "vdev %p req %p sector %"PRIu64" nsectors %zu"
 virtio_blk_submit_multireq(void *vdev, void *mrb, int start, int num_req=
s, uint64_t offset, size_t size, bool is_write) "vdev %p mrb %p start %d =
num_reqs %d offset %"PRIu64" size %zu is_write %d"
=20
-# hw/block/hd-geometry.c
+# hd-geometry.c
 hd_geometry_lchs_guess(void *blk, int cyls, int heads, int secs) "blk %p=
 LCHS %d %d %d"
 hd_geometry_guess(void *blk, uint32_t cyls, uint32_t heads, uint32_t sec=
s, int trans) "blk %p CHS %u %u %u trans %d"
=20
-# hw/block/nvme.c
+# nvme.c
 # nvme traces for successful events
 nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vector %u"
 nvme_irq_pin(void) "pulsing IRQ pin"
@@ -121,7 +121,7 @@ nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t n=
ew_head) "completion queue
 nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write =
for nonexistent queue, sqid=3D%"PRIu32", ignoring"
 nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submissio=
n queue doorbell write value beyond queue size, sqid=3D%"PRIu32", new_hea=
d=3D%"PRIu16", ignoring"
=20
-# hw/block/xen-block.c
+# xen-block.c
 xen_block_realize(const char *type, uint32_t disk, uint32_t partition) "=
%s d%up%u"
 xen_block_connect(const char *type, uint32_t disk, uint32_t partition) "=
%s d%up%u"
 xen_block_disconnect(const char *type, uint32_t disk, uint32_t partition=
) "%s d%up%u"
diff --git a/hw/char/trace-events b/hw/char/trace-events
index de34a74399..3cbb55896b 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -1,47 +1,47 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/char/parallel.c
+# parallel.c
 parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "re=
ad [%s] addr 0x%02x val 0x%02x"
 parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "w=
rite [%s] addr 0x%02x val 0x%02x"
=20
-# hw/char/serial.c
+# serial.c
 serial_ioport_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0=
x%02x"
 serial_ioport_write(uint16_t addr, uint8_t value) "write addr 0x%02x val=
 0x%02x"
=20
-# hw/char/virtio-serial-bus.c
+# virtio-serial-bus.c
 virtio_serial_send_control_event(unsigned int port, uint16_t event, uint=
16_t value) "port %u, event %u, value %u"
 virtio_serial_throttle_port(unsigned int port, bool throttle) "port %u, =
throttle %d"
 virtio_serial_handle_control_message(uint16_t event, uint16_t value) "ev=
ent %u, value %u"
 virtio_serial_handle_control_message_port(unsigned int port) "port %u"
=20
-# hw/char/virtio-console.c
+# virtio-console.c
 virtio_console_flush_buf(unsigned int port, size_t len, ssize_t ret) "po=
rt %u, in_len %zu, out_len %zd"
 virtio_console_chr_read(unsigned int port, int size) "port %u, size %d"
 virtio_console_chr_event(unsigned int port, int event) "port %u, event %=
d"
=20
-# hw/char/grlib_apbuart.c
+# grlib_apbuart.c
 grlib_apbuart_event(int event) "event:%d"
 grlib_apbuart_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PR=
Ix64" value 0x%x"
 grlib_apbuart_readl_unknown(uint64_t addr) "addr 0x%"PRIx64
=20
-# hw/char/lm32_juart.c
+# lm32_juart.c
 lm32_juart_get_jtx(uint32_t value) "jtx 0x%08x"
 lm32_juart_set_jtx(uint32_t value) "jtx 0x%08x"
 lm32_juart_get_jrx(uint32_t value) "jrx 0x%08x"
 lm32_juart_set_jrx(uint32_t value) "jrx 0x%08x"
=20
-# hw/char/lm32_uart.c
+# lm32_uart.c
 lm32_uart_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value=
 0x%08x"
 lm32_uart_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value =
0x%08x"
 lm32_uart_irq_state(int level) "irq state %d"
=20
-# hw/char/milkymist-uart.c
+# milkymist-uart.c
 milkymist_uart_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x v=
alue 0x%08x"
 milkymist_uart_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x =
value 0x%08x"
 milkymist_uart_raise_irq(void) "Raise IRQ"
 milkymist_uart_lower_irq(void) "Lower IRQ"
=20
-# hw/char/escc.c
+# escc.c
 escc_put_queue(char channel, int b) "channel %c put: 0x%02x"
 escc_get_queue(char channel, int val) "channel %c get 0x%02x"
 escc_update_irq(int irq) "IRQ =3D %d"
@@ -56,7 +56,7 @@ escc_sunkbd_event_out(int ch) "Translated keycode 0x%2.=
2x"
 escc_kbd_command(int val) "Command %d"
 escc_sunmouse_event(int dx, int dy, int buttons_state) "dx=3D%d dy=3D%d =
buttons=3D0x%01x"
=20
-# hw/char/pl011.c
+# pl011.c
 pl011_irq_state(int level) "irq state %d"
 pl011_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
@@ -65,7 +65,7 @@ pl011_can_receive(uint32_t lcr, int read_count, int r) =
"LCR 0x%08x read_count %d
 pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now=
 %d"
 pl011_put_fifo_full(void) "FIFO now full, RXFF set"
=20
-# hw/char/cmsdk_apb_uart.c
+# cmsdk_apb_uart.c
 cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size) "CMSD=
K APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_uart_write(uint64_t offset, uint64_t data, unsigned size) "CMS=
DK APB UART write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_uart_reset(void) "CMSDK APB UART: reset"
@@ -74,6 +74,6 @@ cmsdk_apb_uart_tx_pending(void) "CMSDK APB UART: charac=
ter send to backend pendi
 cmsdk_apb_uart_tx(uint8_t c) "CMSDK APB UART: character 0x%x sent to bac=
kend"
 cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: params set to %d 8=
N1"
=20
-# hw/char/nrf51_uart.c
+# nrf51_uart.c
 nrf51_uart_read(uint64_t addr, uint64_t r, unsigned int size) "addr 0x%"=
 PRIx64 " value 0x%" PRIx64 " size %u"
 nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr=
 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
diff --git a/hw/display/trace-events b/hw/display/trace-events
index c09854314b..3a0662cdf1 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -1,29 +1,29 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/display/jazz_led.c
+# jazz_led.c
 jazz_led_read(uint64_t addr, uint8_t val) "read addr=3D0x%"PRIx64": 0x%x=
"
 jazz_led_write(uint64_t addr, uint8_t new) "write addr=3D0x%"PRIx64": 0x=
%x"
=20
-# hw/display/xenfb.c
+# xenfb.c
 xenfb_mouse_event(void *opaque, int dx, int dy, int dz, int button_state=
, int abs_pointer_wanted) "%p x %d y %d z %d bs 0x%x abs %d"
 xenfb_key_event(void *opaque, int scancode, int button_state) "%p scanco=
de %d bs 0x%x"
 xenfb_input_connected(void *xendev, int abs_pointer_wanted) "%p abs %d"
=20
-# hw/display/g364fb.c
+# g364fb.c
 g364fb_read(uint64_t addr, uint32_t val) "read addr=3D0x%"PRIx64": 0x%x"
 g364fb_write(uint64_t addr, uint32_t new) "write addr=3D0x%"PRIx64": 0x%=
x"
=20
-# hw/display/milkymist-tmu2.c
+# milkymist-tmu2.c
 milkymist_tmu2_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x v=
alue 0x%08x"
 milkymist_tmu2_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x =
value 0x%08x"
 milkymist_tmu2_start(void) "Start TMU"
 milkymist_tmu2_pulse_irq(void) "Pulse IRQ"
=20
-# hw/display/milkymist-vgafb.c
+# milkymist-vgafb.c
 milkymist_vgafb_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x =
value 0x%08x"
 milkymist_vgafb_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x=
 value 0x%08x"
=20
-# hw/display/vmware_vga.c
+# vmware_vga.c
 vmware_value_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_value_write(uint32_t index, uint32_t value) "index %d, value 0x%x=
"
 vmware_palette_read(uint32_t index, uint32_t value) "index %d, value 0x%=
x"
@@ -32,7 +32,7 @@ vmware_scratch_read(uint32_t index, uint32_t value) "in=
dex %d, value 0x%x"
 vmware_scratch_write(uint32_t index, uint32_t value) "index %d, value 0x=
%x"
 vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
=20
-# hw/display/virtio-gpu.c
+# virtio-gpu.c
 virtio_gpu_features(bool virgl) "virgl %d"
 virtio_gpu_cmd_get_display_info(void) ""
 virtio_gpu_cmd_get_edid(uint32_t scanout) "scanout %d"
@@ -55,7 +55,7 @@ virtio_gpu_update_cursor(uint32_t scanout, uint32_t x, =
uint32_t y, const char *t
 virtio_gpu_fence_ctrl(uint64_t fence, uint32_t type) "fence 0x%" PRIx64 =
", type 0x%x"
 virtio_gpu_fence_resp(uint64_t fence) "fence 0x%" PRIx64
=20
-# hw/display/qxl.c
+# qxl.c
 disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
 disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint3=
2_t val) "%d %s addr=3D%u val=3D%u"
 qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint6=
4_t mem, uint32_t format, uint32_t position) "%d %ux%u mem=3D0x%" PRIx64 =
" %u,%u"
@@ -117,28 +117,28 @@ qxl_client_monitors_config_capped(int qid, int requ=
ested, int limit) "%d %d %d"
 qxl_client_monitors_config_crc(int qid, unsigned size, uint32_t crc32) "=
%d %u %u"
 qxl_set_client_capabilities_unsupported_by_revision(int qid, int revisio=
n) "%d revision=3D%d"
=20
-# hw/display/qxl-render.c
+# qxl-render.c
 qxl_render_blit(int32_t stride, int32_t left, int32_t right, int32_t top=
, int32_t bottom) "stride=3D%d [%d, %d, %d, %d]"
 qxl_render_guest_primary_resized(int32_t width, int32_t height, int32_t =
stride, int32_t bytes_pp, int32_t bits_pp) "%dx%d, stride %d, bpp %d, dep=
th %d"
 qxl_render_update_area_done(void *cookie) "%p"
=20
-# hw/display/vga.c
+# vga.c
 vga_std_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_std_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_vbe_read(uint32_t index, uint32_t val) "index 0x%x, val 0x%x"
 vga_vbe_write(uint32_t index, uint32_t val) "index 0x%x, val 0x%x"
=20
-# hw/display/cirrus_vga.c
+# cirrus_vga.c
 vga_cirrus_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_read_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x%=
x"
 vga_cirrus_write_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x=
%x"
=20
-# hw/display/sii9022.c
+# sii9022.c
 sii9022_read_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
 sii9022_write_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
 sii9022_switch_mode(const char *mode) "mode: %s"
=20
-# hw/display/ati*.c
+# ati*.c
 ati_mm_read(unsigned int size, uint64_t addr, const char *name, uint64_t=
 val) "%u 0x%"PRIx64 " %s -> 0x%"PRIx64
 ati_mm_write(unsigned int size, uint64_t addr, const char *name, uint64_=
t val) "%u 0x%"PRIx64 " %s <- 0x%"PRIx64
diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index 22f53d0ff2..e4498428c5 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/dma/rc4030.c
+# rc4030.c
 jazzio_read(uint64_t addr, uint32_t ret) "read reg[0x%"PRIx64"] =3D 0x%x=
"
 jazzio_write(uint64_t addr, uint32_t val) "write reg[0x%"PRIx64"] =3D 0x=
%x"
 rc4030_read(uint64_t addr, uint32_t ret) "read reg[0x%"PRIx64"] =3D 0x%x=
"
 rc4030_write(uint64_t addr, uint32_t val) "write reg[0x%"PRIx64"] =3D 0x=
%x"
=20
-# hw/dma/sparc32_dma.c
+# sparc32_dma.c
 ledma_memory_read(uint64_t addr, int len) "DMA read addr 0x%"PRIx64 " le=
n %d"
 ledma_memory_write(uint64_t addr, int len) "DMA write addr 0x%"PRIx64 " =
len %d"
 sparc32_dma_set_irq_raise(void) "Raise IRQ"
@@ -18,5 +18,5 @@ sparc32_dma_mem_writel(uint64_t addr, uint32_t old, uin=
t32_t val) "write dmareg
 sparc32_dma_enable_raise(void) "Raise DMA enable"
 sparc32_dma_enable_lower(void) "Lower DMA enable"
=20
-# hw/dma/i8257.c
+# i8257.c
 i8257_unregistered_dma(int nchan, int dma_pos, int dma_len) "unregistere=
d DMA channel used nchan=3D%d dma_pos=3D%d dma_len=3D%d"
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 5d4dd200c2..c1271fdfb2 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/gpio/nrf51_gpio.c
+# nrf51_gpio.c
 nrf51_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value=
 0x%" PRIx64
 nrf51_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " =
value 0x%" PRIx64
 nrf51_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" P=
RIi64
diff --git a/hw/hppa/trace-events b/hw/hppa/trace-events
index 14c67937e1..4e2acb6176 100644
--- a/hw/hppa/trace-events
+++ b/hw/hppa/trace-events
@@ -1,4 +1,4 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/hppa/pci.c
+# pci.c
 hppa_pci_iack_write(void) ""
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index d339b61202..e1c810d5bd 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/i2c/core.c
+# core.c
=20
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index cae1b76fde..b7eb856a77 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -1,9 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/i386/x86-iommu.c
+# x86-iommu.c
 x86_iommu_iec_notify(bool global, uint32_t index, uint32_t mask) "Notify=
 IEC invalidation: global=3D%d index=3D%" PRIu32 " mask=3D%" PRIu32
=20
-# hw/i386/intel_iommu.c
+# intel_iommu.c
 vtd_inv_desc(const char *type, uint64_t hi, uint64_t lo) "invalidate des=
c type %s high 0x%"PRIx64" low 0x%"PRIx64
 vtd_inv_desc_cc_domain(uint16_t domain) "context invalidate domain 0x%"P=
RIx16
 vtd_inv_desc_cc_global(void) "context invalidate globally"
@@ -67,7 +67,7 @@ vtd_warn_invalid_qi_tail(uint16_t tail) "tail 0x%"PRIx1=
6
 vtd_warn_ir_vector(uint16_t sid, int index, int vec, int target) "sid 0x=
%"PRIx16" index %d vec %d (should be: %d)"
 vtd_warn_ir_trigger(uint16_t sid, int index, int trig, int target) "sid =
0x%"PRIx16" index %d trigger %d (should be: %d)"
=20
-# hw/i386/amd_iommu.c
+# amd_iommu.c
 amdvi_evntlog_fail(uint64_t addr, uint32_t head) "error: fail to write a=
t addr 0x%"PRIx64" +  offset 0x%"PRIx32
 amdvi_cache_update(uint16_t domid, uint8_t bus, uint8_t slot, uint8_t fu=
nc, uint64_t gpa, uint64_t txaddr) " update iotlb domid 0x%"PRIx16" devid=
: %02x:%02x.%x gpa 0x%"PRIx64" hpa 0x%"PRIx64
 amdvi_completion_wait_fail(uint64_t addr) "error: fail to write at addre=
ss 0x%"PRIx64
@@ -110,6 +110,6 @@ amdvi_ir_generate_msi_message(uint8_t vector, uint8_t=
 delivery_mode, uint8_t des
 amdvi_ir_irte_ga(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" offset =
0x%"PRIx64
 amdvi_ir_irte_ga_val(uint64_t hi, uint64_t lo) "hi 0x%"PRIx64" lo 0x%"PR=
Ix64
=20
-# hw/i386/vmport.c
+# vmport.c
 vmport_register(unsigned char command, void *func, void *opaque) "comman=
d: 0x%02x func: %p opaque: %p"
 vmport_command(unsigned char command) "command: 0x%02x"
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index 8732741541..ca3a4948ba 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -1,9 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/i386/xen/xen_platform.c
+# xen_platform.c
 xen_platform_log(char *s) "xen platform: %s"
=20
-# hw/i386/xen/xen_pvdevice.c
+# xen_pvdevice.c
 xen_pv_mmio_read(uint64_t addr) "WARNING: read from Xen PV Device MMIO s=
pace (address 0x%"PRIx64")"
 xen_pv_mmio_write(uint64_t addr) "WARNING: write to Xen PV Device MMIO s=
pace (address 0x%"PRIx64")"
=20
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 65d6f9034d..ac39561d88 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/ide/core.c
+# core.c
 # portio
 ide_ioport_read(uint32_t addr, const char *reg, uint32_t val, void *bus,=
 void *s)  "IDE PIO rd @ 0x%"PRIx32" (%s); val 0x%02"PRIx32"; bus %p IDES=
tate %p"
 ide_ioport_write(uint32_t addr, const char *reg, uint32_t val, void *bus=
, void *s) "IDE PIO wr @ 0x%"PRIx32" (%s); val 0x%02"PRIx32"; bus %p IDES=
tate %p"
@@ -23,30 +23,30 @@ ide_dma_cb(void *s, int64_t sector_num, int n, const =
char *dma) "IDEState %p; se
=20
 # BMDMA HBAs:
=20
-# hw/ide/cmd646.c
+# cmd646.c
 bmdma_read_cmd646(uint64_t addr, uint32_t val) "bmdma: readb 0x%"PRIx64"=
 : 0x%02x"
 bmdma_write_cmd646(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx6=
4" : 0x%02"PRIx64
=20
-# hw/ide/pci.c
+# pci.c
 bmdma_reset(void) ""
 bmdma_cmd_writeb(uint32_t val) "val: 0x%08x"
 bmdma_addr_read(uint64_t data) "data: 0x%016"PRIx64
 bmdma_addr_write(uint64_t data) "data: 0x%016"PRIx64
=20
-# hw/ide/piix.c
+# piix.c
 bmdma_read(uint64_t addr, uint8_t val) "bmdma: readb 0x%"PRIx64" : 0x%02=
x"
 bmdma_write(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" : 0x=
%02"PRIx64
=20
-# hw/ide/sii3112.c
+# sii3112.c
 sii3112_read(int size, uint64_t addr, uint64_t val) "bmdma: read (size %=
d) 0x%"PRIx64" : 0x%02"PRIx64
 sii3112_write(int size, uint64_t addr, uint64_t val) "bmdma: write (size=
 %d) 0x%"PRIx64" : 0x%02"PRIx64
 sii3112_set_irq(int channel, int level) "channel %d level %d"
=20
-# hw/ide/via.c
+# via.c
 bmdma_read_via(uint64_t addr, uint32_t val) "bmdma: readb 0x%"PRIx64" : =
0x%02x"
 bmdma_write_via(uint64_t addr, uint64_t val) "bmdma: writeb 0x%"PRIx64" =
: 0x%02"PRIx64
=20
-# hw/ide/atapi.c
+# atapi.c
 cd_read_sector_sync(int lba) "lba=3D%d"
 cd_read_sector_cb(int lba, int ret) "lba=3D%d ret=3D%d"
 cd_read_sector(int lba) "lba=3D%d"
@@ -62,7 +62,7 @@ ide_atapi_cmd_read_dma_cb_aio(void *s, int lba, int n) =
"IDEState: %p; aio read:
 # Warning: Verbose
 ide_atapi_cmd_packet(void *s, uint16_t limit, const char *packet) "IDESt=
ate: %p; limit=3D0x%x packet: %s"
=20
-# hw/ide/ahci.c
+# ahci.c
 ahci_port_read(void *s, int port, const char *reg, int offset, uint32_t =
ret) "ahci(%p)[%d]: port read [reg:%s] @ 0x%x: 0x%08x"
 ahci_port_read_default(void *s, int port, const char *reg, int offset) "=
ahci(%p)[%d]: unimplemented port read [reg:%s] @ 0x%x"
 ahci_irq_raise(void *s) "ahci(%p): raise irq"
diff --git a/hw/input/trace-events b/hw/input/trace-events
index 8e53ae5bbf..499e5a66e4 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -1,27 +1,27 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/input/adb-kbd.c
+# adb-kbd.c
 adb_kbd_no_key(void) "Ignoring NO_KEY"
 adb_kbd_writereg(int reg, uint8_t val) "reg %d val 0x%2.2x"
 adb_kbd_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0x%=
2.2x obuf[1] 0x%2.2x"
 adb_kbd_request_change_addr(int devaddr) "change addr to 0x%x"
 adb_kbd_request_change_addr_and_handler(int devaddr, int handler) "chang=
e addr and handler to 0x%x, 0x%x"
=20
-# hw/input/adb-mouse.c
+# adb-mouse.c
 adb_mouse_flush(void) "flush"
 adb_mouse_writereg(int reg, uint8_t val) "reg %d val 0x%2.2x"
 adb_mouse_readreg(int reg, uint8_t val0, uint8_t val1) "reg %d obuf[0] 0=
x%2.2x obuf[1] 0x%2.2x"
 adb_mouse_request_change_addr(int devaddr) "change addr to 0x%x"
 adb_mouse_request_change_addr_and_handler(int devaddr, int handler) "cha=
nge addr and handler to 0x%x, 0x%x"
=20
-# hw/input/pckbd.c
+# pckbd.c
 pckbd_kbd_read_data(uint32_t val) "0x%02x"
 pckbd_kbd_read_status(int status) "0x%02x"
 pckbd_outport_write(uint32_t val) "0x%02x"
 pckbd_kbd_write_command(uint64_t val) "0x%02"PRIx64
 pckbd_kbd_write_data(uint64_t val) "0x%02"PRIx64
=20
-# hw/input/ps2.c
+# ps2.c
 ps2_put_keycode(void *opaque, int keycode) "%p keycode 0x%02x"
 ps2_keyboard_event(void *opaque, int qcode, int down, unsigned int modif=
ier, unsigned int modifiers) "%p qcode %d down %d modifier 0x%x modifiers=
 0x%x"
 ps2_read_data(void *opaque) "%p"
@@ -37,19 +37,19 @@ ps2_mouse_reset(void *opaque) "%p"
 ps2_kbd_init(void *s) "%p"
 ps2_mouse_init(void *s) "%p"
=20
-# hw/input/milkymist-softusb.c
+# milkymist-softusb.c
 milkymist_softusb_memory_read(uint32_t addr, uint32_t value) "addr 0x%08=
x value 0x%08x"
 milkymist_softusb_memory_write(uint32_t addr, uint32_t value) "addr 0x%0=
8x value 0x%08x"
 milkymist_softusb_mevt(uint8_t m) "m %d"
 milkymist_softusb_kevt(uint8_t m) "m %d"
 milkymist_softusb_pulse_irq(void) "Pulse IRQ"
=20
-# hw/input/hid.c
+# hid.c
 hid_kbd_queue_full(void) "queue full"
 hid_kbd_queue_empty(void) "queue empty"
=20
-# hw/input/tsc2005.c
+# tsc2005.c
 tsc2005_sense(const char *state) "touchscreen sense %s"
=20
-# hw/input/virtio
+# virtio
 virtio_input_queue_full(void) "queue full"
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 7769869a13..e9ee6554fe 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -1,13 +1,13 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/intc/i8259.c
+# i8259.c
 pic_update_irq(bool master, uint8_t imr, uint8_t irr, uint8_t padd) "mas=
ter %d imr %"PRIu8" irr %"PRIu8" padd %"PRIu8
 pic_set_irq(bool master, int irq, int level) "master %d irq %d level %d"
 pic_interrupt(int irq, int intno) "irq %d intno %d"
 pic_ioport_write(bool master, uint64_t addr, uint64_t val) "master %d ad=
dr 0x%"PRIx64" val 0x%"PRIx64
 pic_ioport_read(bool master, uint64_t addr, int val) "master %d addr 0x%=
"PRIx64" val 0x%x"
=20
-# hw/intc/apic_common.c
+# apic_common.c
 cpu_set_apic_base(uint64_t val) "0x%016"PRIx64
 cpu_get_apic_base(uint64_t val) "0x%016"PRIx64
 # coalescing
@@ -15,13 +15,13 @@ apic_report_irq_delivered(int apic_irq_delivered) "co=
alescing %d"
 apic_reset_irq_delivered(int apic_irq_delivered) "old coalescing %d"
 apic_get_irq_delivered(int apic_irq_delivered) "returning coalescing %d"
=20
-# hw/intc/apic.c
+# apic.c
 apic_local_deliver(int vector, uint32_t lvt) "vector %d delivery mode %d=
"
 apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,=
 uint8_t vector_num, uint8_t trigger_mode) "dest %d dest_mode %d delivery=
_mode %d vector %d trigger_mode %d"
 apic_mem_readl(uint64_t addr, uint32_t val)  "0x%"PRIx64" =3D 0x%08x"
 apic_mem_writel(uint64_t addr, uint32_t val) "0x%"PRIx64" =3D 0x%08x"
=20
-# hw/intc/ioapic.c
+# ioapic.c
 ioapic_set_remote_irr(int n) "set remote irr for pin %d"
 ioapic_clear_remote_irr(int n, int vector) "clear remote irr for pin %d =
vector %d"
 ioapic_eoi_broadcast(int vector) "EOI broadcast for vector %d"
@@ -29,7 +29,7 @@ ioapic_mem_read(uint8_t addr, uint8_t regsel, uint8_t s=
ize, uint32_t val) "ioapi
 ioapic_mem_write(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t va=
l) "ioapic mem write addr 0x%"PRIx8" regsel: 0x%"PRIx8" size 0x%"PRIx8" v=
al 0x%"PRIx32
 ioapic_set_irq(int vector, int level) "vector: %d level: %d"
=20
-# hw/intc/slavio_intctl.c
+# slavio_intctl.c
 slavio_intctl_mem_readl(uint32_t cpu, uint64_t addr, uint32_t ret) "read=
 cpu %d reg 0x%"PRIx64" =3D 0x%x"
 slavio_intctl_mem_writel(uint32_t cpu, uint64_t addr, uint32_t val) "wri=
te cpu %d reg 0x%"PRIx64" =3D 0x%x"
 slavio_intctl_mem_writel_clear(uint32_t cpu, uint32_t val, uint32_t intr=
eg_pending) "Cleared cpu %d irq mask 0x%x, curmask 0x%x"
@@ -43,14 +43,14 @@ slavio_check_interrupts(uint32_t pending, uint32_t in=
tregm_disabled) "pending 0x
 slavio_set_irq(uint32_t target_cpu, int irq, uint32_t pil, int level) "S=
et cpu %d irq %d -> pil %d level %d"
 slavio_set_timer_irq_cpu(int cpu, int level) "Set cpu %d local timer lev=
el %d"
=20
-# hw/intc/grlib_irqmp.c
+# grlib_irqmp.c
 grlib_irqmp_check_irqs(uint32_t pend, uint32_t force, uint32_t mask, uin=
t32_t lvl1, uint32_t lvl2) "pend:0x%04x force:0x%04x mask:0x%04x lvl1:0x%=
04x lvl0:0x%04x"
 grlib_irqmp_ack(int intno) "interrupt:%d"
 grlib_irqmp_set_irq(int irq) "Raise CPU IRQ %d"
 grlib_irqmp_readl_unknown(uint64_t addr) "addr 0x%"PRIx64
 grlib_irqmp_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx=
64" value 0x%x"
=20
-# hw/intc/lm32_pic.c
+# lm32_pic.c
 lm32_pic_raise_irq(void) "Raise CPU interrupt"
 lm32_pic_lower_irq(void) "Lower CPU interrupt"
 lm32_pic_interrupt(int irq, int level) "Set IRQ%d %d"
@@ -59,7 +59,7 @@ lm32_pic_set_ip(uint32_t ip) "ip 0x%08x"
 lm32_pic_get_im(uint32_t im) "im 0x%08x"
 lm32_pic_get_ip(uint32_t ip) "ip 0x%08x"
=20
-# hw/intc/xics.c
+# xics.c
 xics_icp_check_ipi(int server, uint8_t mfrr) "CPU %d can take IPI mfrr=3D=
0x%x"
 xics_icp_accept(uint32_t old_xirr, uint32_t new_xirr) "icp_accept: XIRR =
0x%"PRIx32"->0x%"PRIx32
 xics_icp_eoi(int server, uint32_t xirr, uint32_t new_xirr) "icp_eoi: ser=
ver %d given XIRR 0x%"PRIx32" new XIRR 0x%"PRIx32
@@ -72,23 +72,23 @@ xics_ics_simple_write_xive(int nr, int srcno, int ser=
ver, uint8_t priority) "ics
 xics_ics_simple_reject(int nr, int srcno) "reject irq 0x%x [src %d]"
 xics_ics_simple_eoi(int nr) "ics_eoi: irq 0x%x"
=20
-# hw/intc/s390_flic_kvm.c
+# s390_flic_kvm.c
 flic_create_device(int err) "flic: create device failed %d"
 flic_no_device_api(int err) "flic: no Device Contral API support %d"
 flic_reset_failed(int err) "flic: reset failed %d"
=20
-# hw/intc/s390_flic.c
+# s390_flic.c
 qemu_s390_airq_suppressed(uint8_t type, uint8_t isc) "flic: adapter I/O =
interrupt suppressed (type 0x%x isc 0x%x)"
 qemu_s390_suppress_airq(uint8_t isc, const char *from, const char *to) "=
flic: for isc 0x%x, suppress airq by modifying ais mode from %s to %s"
=20
-# hw/intc/aspeed_vic.c
+# aspeed_vic.c
 aspeed_vic_set_irq(int irq, int level) "Enabling IRQ %d: %d"
 aspeed_vic_update_fiq(int flags) "Raising FIQ: %d"
 aspeed_vic_update_irq(int flags) "Raising IRQ: %d"
 aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "From 0x=
%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%"=
 PRIx64 " of size %u: 0x%" PRIx32
=20
-# hw/intc/arm_gic.c
+# arm_gic.c
 gic_enable_irq(int irq) "irq %d enabled"
 gic_disable_irq(int irq) "irq %d disabled"
 gic_set_irq(int irq, int level, int cpumask, int target) "irq %d level %=
d cpumask 0x%x target 0x%x"
@@ -104,7 +104,7 @@ gic_dist_write(int addr, unsigned int size, uint32_t =
val) "dist write at 0x%08x
 gic_lr_entry(int cpu, int entry, uint32_t val) "cpu %d: new lr entry %d:=
 0x%08" PRIx32
 gic_update_maintenance_irq(int cpu, int val) "cpu %d: maintenance =3D %d=
"
=20
-# hw/intc/arm_gicv3_cpuif.c
+# arm_gicv3_cpuif.c
 gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu 0=
x%x value 0x%" PRIx64
 gicv3_icc_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR write cpu=
 0x%x value 0x%" PRIx64
 gicv3_icc_bpr_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d=
 read cpu 0x%x value 0x%" PRIx64
@@ -163,14 +163,14 @@ gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_=
t val) "GICv3 ICV_EOIR%d writ
 gicv3_cpuif_virt_update(uint32_t cpuid, int idx) "GICv3 CPU i/f 0x%x vir=
t HPPI update LR index %d"
 gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel, in=
t maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d=
 maintenance-irq %d"
=20
-# hw/intc/arm_gicv3_dist.c
+# arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secu=
re) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size=
 %u secure %d"
 gicv3_dist_badread(uint64_t offset, unsigned size, bool secure) "GICv3 d=
istributor read: offset 0x%" PRIx64 " size %u secure %d: error"
 gicv3_dist_write(uint64_t offset, uint64_t data, unsigned size, bool sec=
ure) "GICv3 distributor write: offset 0x%" PRIx64 " data 0x%" PRIx64 " si=
ze %u secure %d"
 gicv3_dist_badwrite(uint64_t offset, uint64_t data, unsigned size, bool =
secure) "GICv3 distributor write: offset 0x%" PRIx64 " data 0x%" PRIx64 "=
 size %u secure %d: error"
 gicv3_dist_set_irq(int irq, int level) "GICv3 distributor interrupt %d l=
evel changed to %d"
=20
-# hw/intc/arm_gicv3_redist.c
+# arm_gicv3_redist.c
 gicv3_redist_read(uint32_t cpu, uint64_t offset, uint64_t data, unsigned=
 size, bool secure) "GICv3 redistributor 0x%x read: offset 0x%" PRIx64 " =
data 0x%" PRIx64 " size %u secure %d"
 gicv3_redist_badread(uint32_t cpu, uint64_t offset, unsigned size, bool =
secure) "GICv3 redistributor 0x%x read: offset 0x%" PRIx64 " size %u secu=
re %d: error"
 gicv3_redist_write(uint32_t cpu, uint64_t offset, uint64_t data, unsigne=
d size, bool secure) "GICv3 redistributor 0x%x write: offset 0x%" PRIx64 =
" data 0x%" PRIx64 " size %u secure %d"
@@ -178,7 +178,7 @@ gicv3_redist_badwrite(uint32_t cpu, uint64_t offset, =
uint64_t data, unsigned siz
 gicv3_redist_set_irq(uint32_t cpu, int irq, int level) "GICv3 redistribu=
tor 0x%x interrupt %d level changed to %d"
 gicv3_redist_send_sgi(uint32_t cpu, int irq) "GICv3 redistributor 0x%x p=
ending SGI %d"
=20
-# hw/intc/armv7m_nvic.c
+# armv7m_nvic.c
 nvic_recompute_state(int vectpending, int vectpending_prio, int exceptio=
n_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d except=
ion_prio %d"
 nvic_recompute_state_secure(int vectpending, bool vectpending_is_s_banke=
d, int vectpending_prio, int exception_prio) "NVIC state recomputed: vect=
pending %d is_s_banked %d vectpending_prio %d exception_prio %d"
 nvic_set_prio(int irq, bool secure, uint8_t prio) "NVIC set irq %d secur=
e-bank %d priority %d"
@@ -196,7 +196,7 @@ nvic_set_nmi_level(int level) "NVIC external NMI leve=
l set to %d"
 nvic_sysreg_read(uint64_t addr, uint32_t value, unsigned size) "NVIC sys=
reg read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 nvic_sysreg_write(uint64_t addr, uint32_t value, unsigned size) "NVIC sy=
sreg write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
=20
-# hw/intc/heathrow_pic.c
+# heathrow_pic.c
 heathrow_write(uint64_t addr, unsigned int n, uint64_t value) "0x%"PRIx6=
4" %u: 0x%"PRIx64
 heathrow_read(uint64_t addr, unsigned int n, uint64_t value) "0x%"PRIx64=
" %u: 0x%"PRIx64
 heathrow_set_irq(int num, int level) "set_irq: num=3D0x%02x level=3D%d"
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index 80ac6175d6..202f8938e7 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -1,11 +1,11 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/isa/isa-superio.c
+# isa-superio.c
 superio_create_parallel(int id, uint16_t base, unsigned int irq) "id=3D%=
d, base 0x%03x, irq %u"
 superio_create_serial(int id, uint16_t base, unsigned int irq) "id=3D%d,=
 base 0x%03x, irq %u"
 superio_create_floppy(int id, uint16_t base, unsigned int irq) "id=3D%d,=
 base 0x%03x, irq %u"
 superio_create_ide(int id, uint16_t base, unsigned int irq) "id=3D%d, ba=
se 0x%03x, irq %u"
=20
-# hw/isa/pc87312.c
+# pc87312.c
 pc87312_io_read(uint32_t addr, uint32_t val) "read addr=3D0x%x val=3D0x%=
x"
 pc87312_io_write(uint32_t addr, uint32_t val) "write addr=3D0x%x val=3D0=
x%x"
diff --git a/hw/mem/trace-events b/hw/mem/trace-events
index 0f2f278ff2..9f6b52acd7 100644
--- a/hw/mem/trace-events
+++ b/hw/mem/trace-events
@@ -1,8 +1,8 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/mem/pc-dimm.c
+# pc-dimm.c
 mhp_pc_dimm_assigned_slot(int slot) "%d"
-# hw/mem/memory-device.c
+# memory-device.c
 memory_device_pre_plug(const char *id, uint64_t addr) "id=3D%s addr=3D0x=
%"PRIx64
 memory_device_plug(const char *id, uint64_t addr) "id=3D%s addr=3D0x%"PR=
Ix64
 memory_device_unplug(const char *id, uint64_t addr) "id=3D%s addr=3D0x%"=
PRIx64
diff --git a/hw/misc/macio/trace-events b/hw/misc/macio/trace-events
index 05019262fa..369f3c0f89 100644
--- a/hw/misc/macio/trace-events
+++ b/hw/misc/macio/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/misc/macio/cuda.c
+# cuda.c
 cuda_delay_set_sr_int(void) ""
 cuda_data_send(uint8_t data) "send: 0x%02x"
 cuda_data_recv(uint8_t data) "recv: 0x%02x"
@@ -10,18 +10,18 @@ cuda_packet_receive_data(int i, const uint8_t data) "=
[%d] 0x%02x"
 cuda_packet_send(int len) "length %d"
 cuda_packet_send_data(int i, const uint8_t data) "[%d] 0x%02x"
=20
-# hw/misc/macio/macio.c
+# macio.c
 macio_timer_write(uint64_t addr, unsigned len, uint64_t val) "write addr=
 0x%"PRIx64 " len %d val 0x%"PRIx64
 macio_timer_read(uint64_t addr, unsigned len, uint32_t val) "read addr 0=
x%"PRIx64 " len %d val 0x%"PRIx32
=20
-# hw/misc/macio/gpio.c
+# gpio.c
 macio_set_gpio(int gpio, bool state) "setting GPIO %d to %d"
 macio_gpio_irq_assert(int gpio) "asserting GPIO %d"
 macio_gpio_irq_deassert(int gpio) "deasserting GPIO %d"
 macio_gpio_write(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64" value: =
0x%"PRIx64
 macio_gpio_read(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64" value: 0=
x%"PRIx64
=20
-# hw/misc/macio/pmu.c
+# pmu.c
 pmu_adb_poll(int olen) "ADB autopoll, olen=3D%d"
 pmu_one_sec_timer(void) "PMU one sec..."
 pmu_cmd_set_int_mask(int intmask) "Setting PMU int mask to 0x%02x"
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c1795bb54b..7095e48f97 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/misc/eccmemctl.c
+# eccmemctl.c
 ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
 ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
 ecc_mem_writel_mfsr(uint32_t val) "Write memory fault status 0x%08x"
@@ -20,7 +20,7 @@ ecc_mem_readl_ecr1(uint32_t ret) "Read event count 2 0x=
%08x"
 ecc_diag_mem_writeb(uint64_t addr, uint32_t val) "Write diagnostic %"PRI=
d64" =3D 0x%02x"
 ecc_diag_mem_readb(uint64_t addr, uint32_t ret) "Read diagnostic %"PRId6=
4"=3D 0x%02x"
=20
-# hw/misc/slavio_misc.c
+# slavio_misc.c
 slavio_misc_update_irq_raise(void) "Raise IRQ"
 slavio_misc_update_irq_lower(void) "Lower IRQ"
 slavio_set_power_fail(int power_failing, uint8_t config) "Power fail: %d=
, config: %d"
@@ -41,20 +41,20 @@ slavio_sysctrl_mem_readl(uint32_t ret) "Read system c=
ontrol 0x%08x"
 slavio_led_mem_writew(uint32_t val) "Write diagnostic LED 0x%04x"
 slavio_led_mem_readw(uint32_t ret) "Read diagnostic LED 0x%04x"
=20
-# hw/misc/milkymist-hpdmc.c
+# milkymist-hpdmc.c
 milkymist_hpdmc_memory_read(uint32_t addr, uint32_t value) "addr=3D0x%08=
x value=3D0x%08x"
 milkymist_hpdmc_memory_write(uint32_t addr, uint32_t value) "addr=3D0x%0=
8x value=3D0x%08x"
=20
-# hw/misc/milkymist-pfpu.c
+# milkymist-pfpu.c
 milkymist_pfpu_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x v=
alue 0x%08x"
 milkymist_pfpu_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x =
value 0x%08x"
 milkymist_pfpu_vectout(uint32_t a, uint32_t b, uint32_t dma_ptr) "a 0x%0=
8x b 0x%08x dma_ptr 0x%08x"
 milkymist_pfpu_pulse_irq(void) "Pulse IRQ"
=20
-# hw/misc/aspeed_scu.c
+# aspeed_scu.c
 aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%"=
 PRIx64 " of size %u: 0x%" PRIx32
=20
-# hw/misc/mps2_scc.c
+# mps2_scc.c
 mps2_scc_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC r=
ead: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_scc_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC =
write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_scc_reset(void) "MPS2 SCC: reset"
@@ -62,29 +62,29 @@ mps2_scc_leds(char led7, char led6, char led5, char l=
ed4, char led3, char led2,
 mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value) "=
MPS2 SCC config write: function %d device %d data 0x%" PRIx32
 mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "M=
PS2 SCC config read: function %d device %d data 0x%" PRIx32
=20
-# hw/misc/mps2_fpgaio.c
+# mps2_fpgaio.c
 mps2_fpgaio_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 FP=
GAIO read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_fpgaio_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 F=
PGAIO write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_fpgaio_reset(void) "MPS2 FPGAIO: reset"
 mps2_fpgaio_leds(char led1, char led0) "MPS2 FPGAIO LEDs: %c%c"
=20
-# hw/misc/msf2-sysreg.c
+# msf2-sysreg.c
 msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sy=
sreg write: addr 0x%08" PRIx64 " data 0x%" PRIx32 " prev 0x%" PRIx32
 msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr =
0x%08" PRIx64 " data 0x%08" PRIx32
 msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL statu=
s register"
=20
-#hw/misc/imx7_gpr.c
+# imx7_gpr.c
 imx7_gpr_read(uint64_t offset) "addr 0x%08" PRIx64
 imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "val=
ue 0x%08" PRIx64
=20
-# hw/misc/mos6522.c
+# mos6522.c
 mos6522_set_counter(int index, unsigned int val) "T%d.counter=3D%d"
 mos6522_get_next_irq_time(uint16_t latch, int64_t d, int64_t delta) "lat=
ch=3D%d counter=3D0x%"PRId64 " delta_next=3D0x%"PRId64
 mos6522_set_sr_int(void) "set sr_int"
 mos6522_write(uint64_t addr, uint64_t val) "reg=3D0x%"PRIx64 " val=3D0x%=
"PRIx64
 mos6522_read(uint64_t addr, unsigned val) "reg=3D0x%"PRIx64 " val=3D0x%x=
"
=20
-# hw/misc/tz-mpc.c
+# tz-mpc.c
 tz_mpc_reg_read(uint32_t offset, uint64_t data, unsigned size) "TZ MPC r=
egs read: offset 0x%x data 0x%" PRIx64 " size %u"
 tz_mpc_reg_write(uint32_t offset, uint64_t data, unsigned size) "TZ MPC =
regs write: offset 0x%x data 0x%" PRIx64 " size %u"
 tz_mpc_mem_blocked_read(uint64_t addr, unsigned size, bool secure) "TZ M=
PC blocked read: offset 0x%" PRIx64 " size %u secure %d"
@@ -92,7 +92,7 @@ tz_mpc_mem_blocked_write(uint64_t addr, uint64_t data, =
unsigned size, bool secur
 tz_mpc_translate(uint64_t addr, int flags, const char *idx, const char *=
res) "TZ MPC translate: addr 0x%" PRIx64 " flags 0x%x iommu_idx %s: %s"
 tz_mpc_iommu_notify(uint64_t addr) "TZ MPC iommu: notifying UNMAP/MAP fo=
r 0x%" PRIx64
=20
-# hw/misc/tz-msc.c
+# tz-msc.c
 tz_msc_reset(void) "TZ MSC: reset"
 tz_msc_cfg_nonsec(int level) "TZ MSC: cfg_nonsec =3D %d"
 tz_msc_cfg_sec_resp(int level) "TZ MSC: cfg_sec_resp =3D %d"
@@ -101,7 +101,7 @@ tz_msc_irq_clear(int level) "TZ MSC: int_clear =3D %d=
"
 tz_msc_update_irq(int level) "TZ MSC: setting irq line to %d"
 tz_msc_access_blocked(uint64_t offset) "TZ MSC: offset 0x%" PRIx64 " acc=
ess blocked"
=20
-# hw/misc/tz-ppc.c
+# tz-ppc.c
 tz_ppc_reset(void) "TZ PPC: reset"
 tz_ppc_cfg_nonsec(int n, int level) "TZ PPC: cfg_nonsec[%d] =3D %d"
 tz_ppc_cfg_ap(int n, int level) "TZ PPC: cfg_ap[%d] =3D %d"
@@ -112,31 +112,31 @@ tz_ppc_update_irq(int level) "TZ PPC: setting irq l=
ine to %d"
 tz_ppc_read_blocked(int n, uint64_t offset, bool secure, bool user) "TZ =
PPC: port %d offset 0x%" PRIx64 " read (secure %d user %d) blocked"
 tz_ppc_write_blocked(int n, uint64_t offset, bool secure, bool user) "TZ=
 PPC: port %d offset 0x%" PRIx64 " write (secure %d user %d) blocked"
=20
-# hw/misc/iotkit-secctl.c
+# iotkit-secctl.c
 iotkit_secctl_s_read(uint32_t offset, uint64_t data, unsigned size) "IoT=
Kit SecCtl S regs read: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_s_write(uint32_t offset, uint64_t data, unsigned size) "Io=
TKit SecCtl S regs write: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_ns_read(uint32_t offset, uint64_t data, unsigned size) "Io=
TKit SecCtl NS regs read: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_ns_write(uint32_t offset, uint64_t data, unsigned size) "I=
oTKit SecCtl NS regs write: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_reset(void) "IoTKit SecCtl: reset"
=20
-# hw/misc/imx6ul_ccm.c
+# imx6ul_ccm.c
 ccm_entry(void) "\n"
 ccm_freq(uint32_t freq) "freq =3D %d\n"
 ccm_clock_freq(uint32_t clock, uint32_t freq) "(Clock =3D %d) =3D %d\n"
 ccm_read_reg(const char *reg_name, uint32_t value) "reg[%s] <=3D 0x%" PR=
Ix32 "\n"
 ccm_write_reg(const char *reg_name, uint32_t value) "reg[%s] =3D> 0x%" P=
RIx32 "\n"
=20
-# hw/misc/iotkit-sysctl.c
+# iotkit-sysctl.c
 iotkit_sysinfo_read(uint64_t offset, uint64_t data, unsigned size) "IoTK=
it SysInfo read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysinfo_write(uint64_t offset, uint64_t data, unsigned size) "IoT=
Kit SysInfo write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_read(uint64_t offset, uint64_t data, unsigned size) "IoTKi=
t SysCtl read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_write(uint64_t offset, uint64_t data, unsigned size) "IoTK=
it SysCtl write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_reset(void) "IoTKit SysCtl: reset"
=20
-# hw/misc/armsse-cpuid.c
+# armsse-cpuid.c
 armsse_cpuid_read(uint64_t offset, uint64_t data, unsigned size) "SSE-20=
0 CPU_IDENTITY read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 armsse_cpuid_write(uint64_t offset, uint64_t data, unsigned size) "SSE-2=
00 CPU_IDENTITY write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
=20
-# hw/misc/armsse-mhu.c
+# armsse-mhu.c
 armsse_mhu_read(uint64_t offset, uint64_t data, unsigned size) "SSE-200 =
MHU read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 armsse_mhu_write(uint64_t offset, uint64_t data, unsigned size) "SSE-200=
 MHU write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 3a86004154..a8f2658602 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -1,15 +1,15 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/net/etraxfs_eth.c
+# etraxfs_eth.c
 mdio_phy_read(int regnum, uint16_t value) "read phy_reg:%d value:0x%04x"
 mdio_phy_write(int regnum, uint16_t value) "write phy_reg:%d value:0x%04=
x"
 mdio_bitbang(bool mdc, bool mdio, int state, uint16_t cnt, unsigned int =
drive) "bitbang mdc=3D%u mdio=3D%u state=3D%d cnt=3D%u drv=3D%d"
=20
-# hw/net/lance.c
+# lance.c
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=3D0x%"PRIx64"val=3D0x=
%04x"
 lance_mem_writew(uint64_t addr, uint32_t val) "addr=3D0x%"PRIx64"val=3D0=
x%04x"
=20
-# hw/net/milkymist-minimac2.c
+# milkymist-minimac2.c
 milkymist_minimac2_memory_read(uint32_t addr, uint32_t value) "addr 0x%0=
8x value 0x%08x"
 milkymist_minimac2_memory_write(uint32_t addr, uint32_t value) "addr 0x%=
08x value 0x%08x"
 milkymist_minimac2_mdio_write(uint8_t phy_addr, uint8_t addr, uint16_t v=
alue) "phy_addr 0x%02x addr 0x%02x value 0x%04x"
@@ -21,20 +21,20 @@ milkymist_minimac2_raise_irq_rx(void) "Raise IRQ RX"
 milkymist_minimac2_lower_irq_rx(void) "Lower IRQ RX"
 milkymist_minimac2_pulse_irq_tx(void) "Pulse IRQ TX"
=20
-# hw/net/mipsnet.c
+# mipsnet.c
 mipsnet_send(uint32_t size) "sending len=3D%u"
 mipsnet_receive(uint32_t size) "receiving len=3D%u"
 mipsnet_read(uint64_t addr, uint32_t val) "read addr=3D0x%" PRIx64 " val=
=3D0x%x"
 mipsnet_write(uint64_t addr, uint64_t val) "write addr=3D0x%" PRIx64 " v=
al=3D0x%" PRIx64
 mipsnet_irq(uint32_t isr, uint32_t intctl) "set irq to %d (0x%02x)"
=20
-# hw/net/ne2000.c
+# ne2000.c
 ne2000_read(uint64_t addr, uint64_t val) "read addr=3D0x%" PRIx64 " val=3D=
0x%" PRIx64
 ne2000_write(uint64_t addr, uint64_t val) "write addr=3D0x%" PRIx64 " va=
l=3D0x%" PRIx64
 ne2000_ioport_read(uint64_t addr, uint64_t val) "io read addr=3D0x%02" P=
RIx64 " val=3D0x%02" PRIx64
 ne2000_ioport_write(uint64_t addr, uint64_t val) "io write addr=3D0x%02"=
 PRIx64 " val=3D0x%02" PRIx64
=20
-# hw/net/opencores_eth.c
+# opencores_eth.c
 open_eth_mii_write(unsigned idx, uint16_t v) "MII[0x%02x] <- 0x%04x"
 open_eth_mii_read(unsigned idx, uint16_t v) "MII[0x%02x] -> 0x%04x"
 open_eth_update_irq(uint32_t v) "IRQ <- 0x%x"
@@ -48,7 +48,7 @@ open_eth_reg_write(uint32_t addr, uint32_t v) "MAC[0x%0=
2x] <- 0x%08x"
 open_eth_desc_read(uint32_t addr, uint32_t v) "DESC[0x%04x] -> 0x%08x"
 open_eth_desc_write(uint32_t addr, uint32_t v) "DESC[0x%04x] <- 0x%08x"
=20
-# hw/net/pcnet.c
+# pcnet.c
 pcnet_s_reset(void *s) "s=3D%p"
 pcnet_user_int(void *s) "s=3D%p"
 pcnet_isr_change(void *s, uint32_t isr, uint32_t isr_old) "s=3D%p INTA=3D=
%d<=3D%d"
@@ -56,13 +56,13 @@ pcnet_init(void *s, uint64_t init_addr) "s=3D%p init_=
addr=3D0x%"PRIx64
 pcnet_rlen_tlen(void *s, uint32_t rlen, uint32_t tlen) "s=3D%p rlen=3D%d=
 tlen=3D%d"
 pcnet_ss32_rdra_tdra(void *s, uint32_t ss32, uint32_t rdra, uint32_t rcv=
rl, uint32_t tdra, uint32_t xmtrl) "s=3D%p ss32=3D%d rdra=3D0x%08x[%d] td=
ra=3D0x%08x[%d]"
=20
-# hw/net/pcnet-pci.c
+# pcnet-pci.c
 pcnet_aprom_writeb(void *opaque, uint32_t addr, uint32_t val) "opaque=3D=
%p addr=3D0x%08x val=3D0x%02x"
 pcnet_aprom_readb(void *opaque, uint32_t addr, uint32_t val) "opaque=3D%=
p addr=3D0x%08x val=3D0x%02x"
 pcnet_ioport_read(void *opaque, uint64_t addr, unsigned size) "opaque=3D=
%p addr=3D0x%"PRIx64" size=3D%d"
 pcnet_ioport_write(void *opaque, uint64_t addr, uint64_t data, unsigned =
size) "opaque=3D%p addr=3D0x%"PRIx64" data=3D0x%"PRIx64" size=3D%d"
=20
-# hw/net/net_rx_pkt.c
+# net_rx_pkt.c
 net_rx_pkt_parsed(bool ip4, bool ip6, bool udp, bool tcp, size_t l3o, si=
ze_t l4o, size_t l5o) "RX packet parsed: ip4: %d, ip6: %d, udp: %d, tcp: =
%d, l3 offset: %zu, l4 offset: %zu, l5 offset: %zu"
 net_rx_pkt_l4_csum_validate_entry(void) "Starting L4 checksum validation=
"
 net_rx_pkt_l4_csum_validate_not_xxp(void) "Not a TCP/UDP packet"
@@ -98,10 +98,10 @@ net_rx_pkt_rss_ip6_ex(void) "Calculating IPv6/EX RSS =
 hash"
 net_rx_pkt_rss_hash(size_t rss_length, uint32_t rss_hash) "RSS hash for =
%zu bytes: 0x%X"
 net_rx_pkt_rss_add_chunk(void* ptr, size_t size, size_t input_offset) "A=
dd RSS chunk %p, %zu bytes, RSS input offset %zu bytes"
=20
-# hw/net/e1000.c
+# e1000.c
 e1000_receiver_overrun(size_t s, uint32_t rdh, uint32_t rdt) "Receiver o=
verrun: dropped packet of %zu bytes, RDH=3D%u, RDT=3D%u"
=20
-# hw/net/e1000x_common.c
+# e1000x_common.c
 e1000x_rx_can_recv_disabled(bool link_up, bool rx_enabled, bool pci_mast=
er) "link_up: %d, rx_enabled %d, pci_master %d"
 e1000x_vlan_is_vlan_pkt(bool is_vlan_pkt, uint16_t eth_proto, uint16_t v=
et) "Is VLAN packet: %d, ETH proto: 0x%X, VET: 0x%X"
 e1000x_rx_flt_ucast_match(uint32_t idx, uint8_t b0, uint8_t b1, uint8_t =
b2, uint8_t b3, uint8_t b4, uint8_t b5) "unicast match[%d]: %02x:%02x:%02=
x:%02x:%02x:%02x"
@@ -114,7 +114,7 @@ e1000x_mac_indicate(uint8_t b0, uint8_t b1, uint8_t b=
2, uint8_t b3, uint8_t b4,
 e1000x_link_negotiation_start(void) "Start link auto negotiation"
 e1000x_link_negotiation_done(void) "Auto negotiation is completed"
=20
-# hw/net/e1000e_core.c
+# e1000e_core.c
 e1000e_core_write(uint64_t index, uint32_t size, uint64_t val) "Write to=
 register 0x%"PRIx64", %d byte(s), value: 0x%"PRIx64
 e1000e_core_read(uint64_t index, uint32_t size, uint64_t val) "Read from=
 register 0x%"PRIx64", %d byte(s), value: 0x%"PRIx64
 e1000e_core_mdic_read(uint8_t page, uint32_t addr, uint32_t data) "MDIC =
READ: PHY[%u][%u] =3D 0x%x"
@@ -245,7 +245,7 @@ e1000e_wrn_msix_invalid(uint32_t cause, uint32_t cfg)=
 "Invalid entry for cause 0
 e1000e_mac_set_permanent(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3,=
 uint8_t b4, uint8_t b5) "Set permanent MAC: %02x:%02x:%02x:%02x:%02x:%02=
x"
 e1000e_mac_set_sw(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3, uint8_=
t b4, uint8_t b5) "Set SW MAC: %02x:%02x:%02x:%02x:%02x:%02x"
=20
-# hw/net/e1000e.c
+# e1000e.c
 e1000e_cb_pci_realize(void) "E1000E PCI realize entry"
 e1000e_cb_pci_uninit(void) "E1000E PCI unit entry"
 e1000e_cb_qdev_reset(void) "E1000E qdev reset entry"
@@ -271,7 +271,7 @@ e1000e_cfg_support_virtio(bool support) "Virtio heade=
r supported: %d"
 e1000e_vm_state_running(void) "VM state is running"
 e1000e_vm_state_stopped(void) "VM state is stopped"
=20
-# hw/net/spapr_llan.c
+# spapr_llan.c
 spapr_vlan_get_rx_bd_from_pool_found(int pool, int32_t count, uint32_t r=
x_bufs) "pool=3D%d count=3D%"PRId32" rxbufs=3D%"PRIu32
 spapr_vlan_get_rx_bd_from_page(int buf_ptr, uint64_t bd) "use_buf_ptr=3D=
%d bd=3D0x%016"PRIx64
 spapr_vlan_get_rx_bd_from_page_found(uint32_t use_buf_ptr, uint32_t rx_b=
ufs) "ptr=3D%"PRIu32" rxbufs=3D%"PRIu32
@@ -287,7 +287,7 @@ spapr_vlan_h_send_logical_lan_rxbufs(uint32_t rx_bufs=
) "rxbufs =3D %"PRIu32
 spapr_vlan_h_send_logical_lan_buf_desc(uint64_t buf) "   buf desc: 0x%"P=
RIx64
 spapr_vlan_h_send_logical_lan_total(int nbufs, unsigned total_len) "%d b=
uffers, total length 0x%x"
=20
-# hw/net/sungem.c
+# sungem.c
 sungem_tx_checksum(uint16_t start, uint16_t off) "TX checksumming from b=
yte %d, inserting at %d"
 sungem_tx_checksum_oob(void) "TX checksum out of packet bounds"
 sungem_tx_unfinished(void) "TX packet started without finishing the prev=
ious one"
@@ -331,7 +331,7 @@ sungem_mmio_mif_read(uint64_t addr, uint64_t val) "MM=
IO mif read from 0x%"PRIx64
 sungem_mmio_pcs_write(uint64_t addr, uint64_t val) "MMIO pcs write to 0x=
%"PRIx64" val=3D0x%"PRIx64
 sungem_mmio_pcs_read(uint64_t addr, uint64_t val) "MMIO pcs read from 0x=
%"PRIx64" val=3D0x%"PRIx64
=20
-# hw/net/sunhme.c
+# sunhme.c
 sunhme_seb_write(uint64_t addr, uint64_t value) "addr 0x%"PRIx64" value =
0x%"PRIx64
 sunhme_seb_read(uint64_t addr, uint64_t value) "addr 0x%"PRIx64" value 0=
x%"PRIx64
 sunhme_etx_write(uint64_t addr, uint64_t value) "addr 0x%"PRIx64" value =
0x%"PRIx64
@@ -360,7 +360,7 @@ sunhme_rx_filter_accept(void) "accepting incoming fra=
me"
 sunhme_rx_desc(uint32_t addr, int offset, uint32_t status, int len, int =
cr, int nr) "addr 0x%"PRIx32"(+0x%x) status 0x%"PRIx32 " len %d (ring %d/=
%d)"
 sunhme_rx_xsum_calc(uint16_t xsum) "calculated incoming xsum as 0x%x"
=20
-# hw/net/virtio-net.c
+# virtio-net.c
 virtio_net_announce_notify(void) ""
 virtio_net_announce_timer(int round) "%d"
 virtio_net_handle_announce(int round) "%d"
diff --git a/hw/nvram/trace-events b/hw/nvram/trace-events
index 6b55ba7a09..e191991e2a 100644
--- a/hw/nvram/trace-events
+++ b/hw/nvram/trace-events
@@ -1,10 +1,10 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/nvram/ds1225y.c
+# ds1225y.c
 nvram_read(uint32_t addr, uint32_t ret) "read addr %d: 0x%02x"
 nvram_write(uint32_t addr, uint32_t old, uint32_t val) "write addr %d: 0=
x%02x -> 0x%02x"
=20
-# hw/nvram/fw_cfg.c
+# fw_cfg.c
 fw_cfg_select(void *s, uint16_t key, int ret) "%p key %d =3D %d"
 fw_cfg_read(void *s, uint64_t ret) "%p =3D 0x%"PRIx64
 fw_cfg_add_file(void *s, int index, char *name, size_t len) "%p #%d: %s =
(%zd bytes)"
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index dd7a398e96..d19ca9aef6 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -1,9 +1,9 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/pci-host/grackle.c
+# grackle.c
 grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
=20
-# hw/pci-host/sabre.c
+# sabre.c
 sabre_set_request(int irq_num) "request irq %d"
 sabre_clear_request(int irq_num) "clear request irq %d"
 sabre_config_write(uint64_t addr, uint64_t val) "addr 0x%"PRIx64" val 0x=
%"PRIx64
@@ -13,7 +13,7 @@ sabre_pci_config_read(uint64_t addr, uint64_t val) "add=
r 0x%"PRIx64" val 0x%"PRI
 sabre_pci_set_irq(int irq_num, int level) "set irq_in %d level %d"
 sabre_pci_set_obio_irq(int irq_num, int level) "set irq %d level %d"
=20
-# hw/pci-host/uninorth.c
+# uninorth.c
 unin_set_irq(int irq_num, int level) "setting INT %d =3D %d"
 unin_get_config_reg(uint32_t reg, uint32_t addr, uint32_t retval) "conve=
rted config space accessor 0x%"PRIx32 "/0x%"PRIx32 " -> 0x%"PRIx32
 unin_data_write(uint64_t addr, unsigned len, uint64_t val) "write addr 0=
x%"PRIx64 " len %d val 0x%"PRIx64
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index f68c178afc..def4b3926d 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/pci/pci.c
+# pci.c
 pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t f=
unc, int bar, uint64_t addr, uint64_t size) "d=3D%p %02x:%02x.%x %d,0x%"P=
RIx64"+0x%"PRIx64
 pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t f=
unc, int bar, uint64_t addr, uint64_t size) "d=3D%p %02x:%02x.%x %d,0x%"P=
RIx64"+0x%"PRIx64
=20
-# hw/pci/pci_host.c
+# pci_host.c
 pci_cfg_read(const char *dev, unsigned devid, unsigned fnid, unsigned of=
fs, unsigned val) "%s %02u:%u @0x%x -> 0x%x"
 pci_cfg_write(const char *dev, unsigned devid, unsigned fnid, unsigned o=
ffs, unsigned val) "%s %02u:%u @0x%x <- 0x%x"
=20
-# hw/pci/msix.c
+# msix.c
 msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled=
 %d masked %d"
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 0af155ed32..d1d8b71bfa 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/ppc/spapr_pci.c
+# spapr_pci.c
 spapr_pci_msi(const char *msg, uint32_t ca) "%s (cfg=3D0x%x)"
 spapr_pci_msi_setup(const char *name, unsigned vector, uint64_t addr) "d=
ev\"%s\" vector %u, addr=3D0x%"PRIx64
 spapr_pci_rtas_ibm_change_msi(unsigned cfg, unsigned func, unsigned req,=
 unsigned first) "cfgaddr 0x%x func %u, requested %u, first irq %u"
@@ -9,7 +9,7 @@ spapr_pci_msi_write(uint64_t addr, uint64_t data, uint32_=
t dt_irq) "@0x%"PRIx64"
 spapr_pci_lsi_set(const char *busname, int pin, uint32_t irq) "%s PIN%d =
IRQ %u"
 spapr_pci_msi_retry(unsigned config_addr, unsigned req_num, unsigned max=
_irqs) "Guest device at 0x%x asked %u, have only %u"
=20
-# hw/ppc/spapr.c
+# spapr.c
 spapr_cas_failed(unsigned long n) "DT diff buffer is too small: %ld byte=
s"
 spapr_cas_continue(unsigned long n) "Copy changes to the guest: %ld byte=
s"
 spapr_irq_alloc(int irq) "irq %d"
@@ -17,7 +17,7 @@ spapr_irq_alloc_block(int first, int num, bool lsi, int=
 align) "first irq %d, %d
 spapr_irq_free(int src, int irq, int num) "Source#%d, first irq %d, %d i=
rqs"
 spapr_irq_free_warn(int src, int irq) "Source#%d, irq %d is already free=
"
=20
-# hw/ppc/spapr_hcall.c
+# spapr_hcall.c
 spapr_cas_pvr_try(uint32_t pvr) "0x%x"
 spapr_cas_pvr(uint32_t cur_pvr, bool explicit_match, uint32_t new_pvr) "=
current=3D0x%x, explicit_match=3D%u, new=3D0x%x"
 spapr_h_resize_hpt_prepare(uint64_t flags, uint64_t shift) "flags=3D0x%"=
PRIx64", shift=3D%"PRIu64
@@ -26,7 +26,7 @@ spapr_update_dt(unsigned cb) "New blob %u bytes"
 spapr_update_dt_failed_size(unsigned cbold, unsigned cbnew, unsigned mag=
ic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
 spapr_update_dt_failed_check(unsigned cbold, unsigned cbnew, unsigned ma=
gic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
=20
-# hw/ppc/spapr_iommu.c
+# spapr_iommu.c
 spapr_iommu_put(uint64_t liobn, uint64_t ioba, uint64_t tce, uint64_t re=
t) "liobn=3D0x%"PRIx64" ioba=3D0x%"PRIx64" tce=3D0x%"PRIx64" ret=3D%"PRId=
64
 spapr_iommu_get(uint64_t liobn, uint64_t ioba, uint64_t ret, uint64_t tc=
e) "liobn=3D0x%"PRIx64" ioba=3D0x%"PRIx64" ret=3D%"PRId64" tce=3D0x%"PRIx=
64
 spapr_iommu_indirect(uint64_t liobn, uint64_t ioba, uint64_t tce, uint64=
_t iobaN, uint64_t tceN, uint64_t ret) "liobn=3D0x%"PRIx64" ioba=3D0x%"PR=
Ix64" tcelist=3D0x%"PRIx64" iobaN=3D0x%"PRIx64" tceN=3D0x%"PRIx64" ret=3D=
%"PRId64
@@ -44,7 +44,7 @@ spapr_iommu_ddw_create(uint64_t buid, uint32_t cfgaddr,=
 uint64_t pg_size, uint64
 spapr_iommu_ddw_remove(uint32_t liobn) "liobn=3D0x%"PRIx32
 spapr_iommu_ddw_reset(uint64_t buid, uint32_t cfgaddr) "buid=3D0x%"PRIx6=
4" addr=3D0x%"PRIx32
=20
-# hw/ppc/spapr_drc.c
+# spapr_drc.c
 spapr_drc_set_isolation_state(uint32_t index, int state) "drc: 0x%"PRIx3=
2", state: 0x%"PRIx32
 spapr_drc_set_isolation_state_finalizing(uint32_t index) "drc: 0x%"PRIx3=
2
 spapr_drc_set_isolation_state_deferring(uint32_t index) "drc: 0x%"PRIx32
@@ -63,43 +63,43 @@ spapr_drc_realize_child(uint32_t index, char *childna=
me) "drc: 0x%"PRIx32", chil
 spapr_drc_realize_complete(uint32_t index) "drc: 0x%"PRIx32
 spapr_drc_unrealize(uint32_t index) "drc: 0x%"PRIx32
=20
-# hw/ppc/spapr_ovec.c
+# spapr_ovec.c
 spapr_ovec_parse_vector(int vector, int byte, uint16_t vec_len, uint8_t =
entry) "read guest vector %2d, byte %3d / %3d: 0x%.2x"
 spapr_ovec_populate_dt(int byte, uint16_t vec_len, uint8_t entry) "encod=
ing guest vector byte %3d / %3d: 0x%.2x"
=20
-# hw/ppc/spapr_rtas.c
+# spapr_rtas.c
 spapr_rtas_get_sensor_state_not_supported(uint32_t index, uint32_t type)=
 "sensor index: 0x%"PRIx32", type: %"PRIu32
 spapr_rtas_get_sensor_state_invalid(uint32_t index) "sensor index: 0x%"P=
RIx32
 spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0=
x%"PRIx32
 spapr_rtas_ibm_configure_connector_missing_fdt(uint32_t index) "DRC inde=
x: 0x%"PRIx32
=20
-# hw/ppc/spapr_vio.c
+# spapr_vio.c
 spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_le=
n) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
 spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
=20
-# hw/ppc/ppc.c
+# ppc.c
 ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seco=
nds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"=
s)"
=20
-# hw/ppc/prep.c
+# prep.c
 prep_io_800_writeb(uint32_t addr, uint32_t val) "0x%08" PRIx32 " =3D> 0x=
%02" PRIx32
 prep_io_800_readb(uint32_t addr, uint32_t retval) "0x%08" PRIx32 " <=3D =
0x%02" PRIx32
=20
-# hw/ppc/prep_systemio.c
+# prep_systemio.c
 prep_systemio_read(uint32_t addr, uint32_t val) "read addr=3D0x%x val=3D=
0x%x"
 prep_systemio_write(uint32_t addr, uint32_t val) "write addr=3D0x%x val=3D=
0x%x"
=20
-# hw/ppc/rs6000_mc.c
+# rs6000_mc.c
 rs6000mc_id_read(uint32_t addr, uint32_t val) "read addr=3D0x%x val=3D0x=
%x"
 rs6000mc_presence_read(uint32_t addr, uint32_t val) "read addr=3D0x%x va=
l=3D0x%x"
 rs6000mc_size_read(uint32_t addr, uint32_t val) "read addr=3D0x%x val=3D=
0x%x"
 rs6000mc_size_write(uint32_t addr, uint32_t val) "write addr=3D0x%x val=3D=
0x%x"
 rs6000mc_parity_read(uint32_t addr, uint32_t val) "read addr=3D0x%x val=3D=
0x%x"
=20
-# hw/ppc/ppc4xx_pci.c
+# ppc4xx_pci.c
 ppc4xx_pci_map_irq(int32_t devfn, int irq_num, int slot) "devfn 0x%x irq=
 %d -> %d"
 ppc4xx_pci_set_irq(int irq_num) "PCI irq %d"
=20
-# hw/ppc/ppc440_pcix.c
+# ppc440_pcix.c
 ppc440_pcix_map_irq(int32_t devfn, int irq_num, int slot) "devfn 0x%x ir=
q %d -> %d"
 ppc440_pcix_set_irq(int irq_num) "PCI irq %d"
 ppc440_pcix_update_pim(int idx, uint64_t size, uint64_t la) "Added windo=
w %d of size=3D0x%" PRIx64 " to CPU=3D0x%" PRIx64
diff --git a/hw/rdma/trace-events b/hw/rdma/trace-events
index 12868d8a87..2022a820cb 100644
--- a/hw/rdma/trace-events
+++ b/hw/rdma/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/rdma/rdma_backend.c
+# rdma_backend.c
 rdma_check_dev_attr(const char *name, int max_bk, int max_fe) "%s: be=3D=
%d, fe=3D%d"
 rdma_create_ah_cache_hit(uint64_t subnet, uint64_t if_id) "subnet=3D0x%"=
PRIx64",if_id=3D0x%"PRIx64
 rdma_create_ah_cache_miss(uint64_t subnet, uint64_t if_id) "subnet=3D0x%=
"PRIx64",if_id=3D0x%"PRIx64
@@ -17,7 +17,7 @@ rdma_backend_ud_qp_state_rts(uint32_t qpn, uint32_t sq_=
psn, uint32_t qkey) "UD Q
 rdma_backend_get_gid_index(uint64_t subnet, uint64_t ifid, int gid_idx) =
"subnet=3D0x%"PRIx64", ifid=3D0x%"PRIx64 ", gid_idx=3D%d"
 rdma_backend_gid_change(const char *op, uint64_t subnet, uint64_t ifid) =
"%s subnet=3D0x%"PRIx64", ifid=3D0x%"PRIx64
=20
-# hw/rdma/rdma_rm.c
+# rdma_rm.c
 rdma_res_tbl_get(char *name, uint32_t handle) "tbl %s, handle %d"
 rdma_res_tbl_alloc(char *name, uint32_t handle) "tbl %s, handle %d"
 rdma_res_tbl_dealloc(char *name, uint32_t handle) "tbl %s, handle %d"
@@ -26,6 +26,6 @@ rdma_rm_dealloc_mr(uint32_t mr_handle, uint64_t guest_s=
tart) "mr_handle=3D%d, gues
 rdma_rm_alloc_qp(uint32_t rm_qpn, uint32_t backend_qpn, uint8_t qp_type)=
 "rm_qpn=3D%d, backend_qpn=3D0x%x, qp_type=3D%d"
 rdma_rm_modify_qp(uint32_t qpn, uint32_t attr_mask, int qp_state, uint8_=
t sgid_idx) "qpn=3D0x%x, attr_mask=3D0x%x, qp_state=3D%d, sgid_idx=3D%d"
=20
-# hw/rdma/rdma_utils.c
+# rdma_utils.c
 rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" =
-> %p (len=3D%" PRId64")"
 rdma_pci_dma_unmap(void *vaddr) "%p"
diff --git a/hw/rdma/vmw/trace-events b/hw/rdma/vmw/trace-events
index e846d54359..323fca8456 100644
--- a/hw/rdma/vmw/trace-events
+++ b/hw/rdma/vmw/trace-events
@@ -1,17 +1,17 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/rdma/vmw/pvrdma_main.c
+# pvrdma_main.c
 pvrdma_regs_read(uint64_t addr, uint64_t val) "pvrdma.regs[0x%"PRIx64"]=3D=
0x%"PRIx64
 pvrdma_regs_write(uint64_t addr, uint64_t val, const char *reg_name, con=
st char *val_name) "pvrdma.regs[0x%"PRIx64"]=3D0x%"PRIx64" (%s %s)"
 pvrdma_uar_write(uint64_t addr, uint64_t val, const char *reg_name, cons=
t char *val_name, int val1, int val2) "uar[0x%"PRIx64"]=3D0x%"PRIx64" (cl=
s=3D%s, op=3D%s, obj=3D%d, val=3D%d)"
=20
-# hw/rdma/vmw/pvrdma_cmd.c
+# pvrdma_cmd.c
 pvrdma_map_to_pdir_host_virt(void *vfirst, void *vremaped) "mremap %p ->=
 %p"
 pvrdma_map_to_pdir_next_page(int page_idx, void *vnext, void *vremaped) =
"mremap [%d] %p -> %p"
 pvrdma_exec_cmd(int cmd, int err) "cmd=3D%d, err=3D%d"
=20
-# hw/rdma/vmw/pvrdma_dev_ring.c
+# pvrdma_dev_ring.c
 pvrdma_ring_next_elem_read_no_data(char *ring_name) "pvrdma_ring %s is e=
mpty"
=20
-# hw/rdma/vmw/pvrdma_qp_ops.c
+# pvrdma_qp_ops.c
 pvrdma_post_cqe(uint32_t cq_handle, int notify, uint64_t wr_id, uint64_t=
 qpn, uint32_t op_code, uint32_t status, uint32_t byte_len, uint32_t src_=
qp, uint32_t wc_flags, uint32_t vendor_err) "cq_handle=3D%d, notify=3D%d,=
 wr_id=3D0x%"PRIx64", qpn=3D0x%"PRIx64", opcode=3D%d, status=3D%d, byte_l=
en=3D%d, src_qp=3D%d, wc_flags=3D%d, vendor_err=3D%d"
diff --git a/hw/s390x/trace-events b/hw/s390x/trace-events
index 0d3622ec6f..0dc5b818c4 100644
--- a/hw/s390x/trace-events
+++ b/hw/s390x/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/s390x/css.c
+# css.c
 css_enable_facility(const char *facility) "CSS: enable %s"
 css_crw(uint8_t rsc, uint8_t erc, uint16_t rsid, const char *chained) "C=
SS: queueing crw: rsc=3D0x%x, erc=3D0x%x, rsid=3D0x%x %s"
 css_chpid_add(uint8_t cssid, uint8_t chpid, uint8_t type) "CSS: add chpi=
d %x.%02x (type 0x%02x)"
@@ -10,7 +10,7 @@ css_io_interrupt(int cssid, int ssid, int schid, uint32=
_t intparm, uint8_t isc,
 css_adapter_interrupt(uint8_t isc) "CSS: adapter I/O interrupt (isc 0x%x=
)"
 css_do_sic(uint16_t mode, uint8_t isc) "CSS: set interruption mode 0x%x =
on isc 0x%x"
=20
-# hw/s390x/virtio-ccw.c
+# virtio-ccw.c
 virtio_ccw_interpret_ccw(int cssid, int ssid, int schid, int cmd_code) "=
VIRTIO-CCW: %x.%x.%04x: interpret command 0x%x"
 virtio_ccw_new_device(int cssid, int ssid, int schid, int devno, const c=
har *devno_mode) "VIRTIO-CCW: add subchannel %x.%x.%04x, devno 0x%04x (%s=
)"
 virtio_ccw_set_ind(uint64_t ind_loc, uint8_t ind_old, uint8_t ind_new) "=
VIRTIO-CCW: indicator at %" PRIu64 ": 0x%x->0x%x"
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 09f3fc3086..452b5994e6 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/scsi/scsi-bus.c
+# scsi-bus.c
 scsi_req_alloc(int target, int lun, int tag) "target %d lun %d tag %d"
 scsi_req_cancel(int target, int lun, int tag) "target %d lun %d tag %d"
 scsi_req_data(int target, int lun, int tag, int len) "target %d lun %d t=
ag %d len %d"
@@ -18,7 +18,7 @@ scsi_inquiry(int target, int lun, int tag, int cdb1, in=
t cdb2) "target %d lun %d
 scsi_test_unit_ready(int target, int lun, int tag) "target %d lun %d tag=
 %d"
 scsi_request_sense(int target, int lun, int tag) "target %d lun %d tag %=
d"
=20
-# hw/scsi/mptsas.c
+# mptsas.c
 mptsas_command_complete(void *dev, uint32_t ctx, uint32_t status, uint32=
_t resid) "dev %p context 0x%08x status 0x%x resid %d"
 mptsas_diag_read(void *dev, uint32_t addr, uint32_t val) "dev %p addr 0x=
%08x value 0x%08x"
 mptsas_diag_write(void *dev, uint32_t addr, uint32_t val) "dev %p addr 0=
x%08x value 0x%08x"
@@ -36,11 +36,11 @@ mptsas_sgl_overflow(void *dev, uint32_t ctx, uint64_t=
 req, uint64_t found) "dev
 mptsas_unhandled_cmd(void *dev, uint32_t ctx, uint8_t msg_cmd) "dev %p c=
ontext 0x%08x: Unhandled cmd 0x%x"
 mptsas_unhandled_doorbell_cmd(void *dev, int cmd) "dev %p value 0x%08x"
=20
-# hw/scsi/mptconfig.c
+# mptconfig.c
 mptsas_config_sas_device(void *dev, int address, int port, int phy_handl=
e, int dev_handle, int page) "dev %p address %d (port %d, handles: phy %d=
 dev %d) page %d"
 mptsas_config_sas_phy(void *dev, int address, int port, int phy_handle, =
int dev_handle, int page) "dev %p address %d (port %d, handles: phy %d de=
v %d) page %d"
=20
-# hw/scsi/megasas.c
+# megasas.c
 megasas_init_firmware(uint64_t pa) "pa 0x%" PRIx64 " "
 megasas_init_queue(uint64_t queue_pa, int queue_len, uint64_t head, uint=
64_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx6=
4 " tail 0x%" PRIx64 " flags 0x%x"
 megasas_initq_map_failed(int frame) "scmd %d: failed to map queue"
@@ -118,7 +118,7 @@ megasas_mmio_invalid_readl(unsigned long addr) "addr =
0x%lx"
 megasas_mmio_writel(const char *reg, uint32_t val) "reg %s: 0x%x"
 megasas_mmio_invalid_writel(uint32_t addr, uint32_t val) "addr 0x%x: 0x%=
x"
=20
-# hw/scsi/vmw_pvscsi.c
+# vmw_pvscsi.c
 pvscsi_ring_init_data(uint32_t txr_len_log2, uint32_t rxr_len_log2) "TX/=
RX rings logarithms set to %d/%d"
 pvscsi_ring_init_msg(uint32_t len_log2) "MSG ring logarithm set to %d"
 pvscsi_ring_flush_cmp(uint64_t filled_cmp_ptr) "new production counter o=
f completion ring is 0x%"PRIx64
@@ -153,7 +153,7 @@ pvscsi_state(const char* state) "starting %s ..."
 pvscsi_tx_rings_ppn(const char* label, uint64_t ppn) "%s page: 0x%"PRIx6=
4
 pvscsi_tx_rings_num_pages(const char* label, uint32_t num) "Number of %s=
 pages: %u"
=20
-# hw/scsi/esp.c
+# esp.c
 esp_error_fifo_overrun(void) "FIFO overrun"
 esp_error_unhandled_command(uint32_t val) "unhandled command (0x%2.2x)"
 esp_error_invalid_write(uint32_t val, uint32_t addr) "invalid write of 0=
x%02x at [0x%x]"
@@ -190,7 +190,7 @@ esp_mem_writeb_cmd_selatns(uint32_t val) "Select with=
 ATN & stop (0x%2.2x)"
 esp_mem_writeb_cmd_ensel(uint32_t val) "Enable selection (0x%2.2x)"
 esp_mem_writeb_cmd_dissel(uint32_t val) "Disable selection (0x%2.2x)"
=20
-# hw/scsi/esp-pci.c
+# esp-pci.c
 esp_pci_error_invalid_dma_direction(void) "invalid DMA transfer directio=
n"
 esp_pci_error_invalid_read(uint32_t reg) "read access outside bounds (re=
g 0x%x)"
 esp_pci_error_invalid_write(uint32_t reg) "write access outside bounds (=
reg 0x%x)"
@@ -204,7 +204,7 @@ esp_pci_dma_start(uint32_t val) "START (0x%.8x)"
 esp_pci_sbac_read(uint32_t reg) "sbac: 0x%8.8x"
 esp_pci_sbac_write(uint32_t reg, uint32_t val) "sbac: 0x%8.8x -> 0x%8.8x=
"
=20
-# hw/scsi/spapr_vscsi.c
+# spapr_vscsi.c
 spapr_vscsi_send_rsp(uint8_t status, int32_t res_in, int32_t res_out) "s=
tatus: 0x%x, res_in: %"PRId32", res_out: %"PRId32
 spapr_vscsi_fetch_desc_no_data(void) "no data descriptor"
 spapr_vscsi_fetch_desc_direct(void) "direct segment"
@@ -231,7 +231,7 @@ spapr_vscsi_queue_cmd_no_drive(uint64_t lun) "Command=
 for lun 0x%08" PRIx64 " wi
 spapr_vscsi_queue_cmd(uint32_t qtag, unsigned cdb, const char *cmd, int =
lun, int ret) "Queued command tag 0x%"PRIx32" CMD 0x%x=3D%s LUN %d ret: %=
d"
 spapr_vscsi_do_crq(unsigned c0, unsigned c1) "crq: %02x %02x ..."
=20
-# hw/scsi/lsi53c895a.c
+# lsi53c895a.c
 lsi_reset(void) "Reset"
 lsi_update_irq(int level, uint8_t dstat, uint8_t sist1, uint8_t sist0) "=
Update IRQ level %d dstat 0x%02x sist 0x%02x0x%02x"
 lsi_update_irq_disconnected(void) "Handled IRQs & disconnected, looking =
for pending processes"
@@ -293,7 +293,7 @@ lsi_awoken(void) "Woken by SIGP"
 lsi_reg_read(const char *name, int offset, uint8_t ret) "Read reg %s 0x%=
x =3D 0x%02x"
 lsi_reg_write(const char *name, int offset, uint8_t val) "Write reg %s 0=
x%x =3D 0x%02x"
=20
-# hw/scsi/scsi-disk.c
+# scsi-disk.c
 scsi_disk_check_condition(uint32_t tag, uint8_t key, uint8_t asc, uint8_=
t ascq) "Command complete tag=3D0x%x sense=3D%d/%d/%d"
 scsi_disk_read_complete(uint32_t tag, size_t size) "Data ready tag=3D0x%=
x len=3D%zd"
 scsi_disk_read_data_count(uint32_t sector_count) "Read sector_count=3D%d=
"
@@ -322,7 +322,7 @@ scsi_disk_dma_command_READ(uint64_t lba, uint32_t len=
) "Read (sector %" PRId64 "
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Wri=
te %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Com=
mand: lun=3D%d tag=3D0x%x data=3D%s"
=20
-# hw/scsi/scsi-generic.c
+# scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) =
"Command complete %p tag=3D0x%x status=3D%d"
 scsi_generic_read_complete(uint32_t tag, int len) "Data ready tag=3D0x%x=
 len=3D%d"
 scsi_generic_read_data(uint32_t tag) "scsi_read_data tag=3D0x%x"
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index fb0615cd3c..543e339016 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/sd/bcm2835_sdhost.c
+# bcm2835_sdhost.c
 bcm2835_sdhost_read(uint64_t offset, uint64_t data, unsigned size) "offs=
et 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 bcm2835_sdhost_write(uint64_t offset, uint64_t data, unsigned size) "off=
set 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 bcm2835_sdhost_edm_change(const char *why, uint32_t edm) "(%s) EDM now 0=
x%x"
 bcm2835_sdhost_update_irq(uint32_t irq) "IRQ bits 0x%x\n"
=20
-# hw/sd/core.c
+# core.c
 sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg) "@%s CMD%=
02d arg 0x%08x"
 sdbus_read(const char *bus_name, uint8_t value) "@%s value 0x%02x"
 sdbus_write(const char *bus_name, uint8_t value) "@%s value 0x%02x"
@@ -14,7 +14,7 @@ sdbus_set_voltage(const char *bus_name, uint16_t milliv=
olts) "@%s %u (mV)"
 sdbus_get_dat_lines(const char *bus_name, uint8_t dat_lines) "@%s dat_li=
nes: %u"
 sdbus_get_cmd_line(const char *bus_name, bool cmd_line) "@%s cmd_line: %=
u"
=20
-# hw/sd/sdhci.c
+# sdhci.c
 sdhci_set_inserted(const char *level) "card state changed: %s"
 sdhci_send_command(uint8_t cmd, uint32_t arg) "CMD%02u ARG[0x%08x]"
 sdhci_error(const char *msg) "%s"
@@ -29,7 +29,7 @@ sdhci_read_dataport(uint16_t data_count) "all %u bytes =
of data have been read fr
 sdhci_write_dataport(uint16_t data_count) "write buffer filled with %u b=
ytes of data"
 sdhci_capareg(const char *desc, uint16_t val) "%s: %u"
=20
-# hw/sd/sd.c
+# sd.c
 sdcard_normal_command(const char *proto, const char *cmd_desc, uint8_t c=
md, uint32_t arg, const char *state) "%s %20s/ CMD%02d arg 0x%08x (state =
%s)"
 sdcard_app_command(const char *proto, const char *acmd_desc, uint8_t acm=
d, uint32_t arg, const char *state) "%s %23s/ACMD%02d arg 0x%08x (state %=
s)"
 sdcard_response(const char *rspdesc, int rsplen) "%s (sz:%d)"
@@ -49,10 +49,10 @@ sdcard_write_data(const char *proto, const char *cmd_=
desc, uint8_t cmd, uint8_t
 sdcard_read_data(const char *proto, const char *cmd_desc, uint8_t cmd, i=
nt length) "%s %20s/ CMD%02d len %d"
 sdcard_set_voltage(uint16_t millivolts) "%u mV"
=20
-# hw/sd/milkymist-memcard.c
+# milkymist-memcard.c
 milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr 0x%08=
x value 0x%08x"
 milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%0=
8x value 0x%08x"
=20
-# hw/sd/pxa2xx_mmci.c
+# pxa2xx_mmci.c
 pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d a=
ddr 0x%02x value 0x%08x"
 pxa2xx_mmci_write(uint8_t size, uint32_t addr, uint32_t value) "size %d =
addr 0x%02x value 0x%08x"
diff --git a/hw/sparc/trace-events b/hw/sparc/trace-events
index 6e7259f8f8..355b07ae05 100644
--- a/hw/sparc/trace-events
+++ b/hw/sparc/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/sparc/sun4m.c
+# sun4m.c
 sun4m_cpu_interrupt(unsigned int level) "Set CPU IRQ %d"
 sun4m_cpu_reset_interrupt(unsigned int level) "Reset CPU IRQ %d"
 sun4m_cpu_set_irq_raise(int level) "Raise CPU IRQ %d"
 sun4m_cpu_set_irq_lower(int level) "Lower CPU IRQ %d"
=20
-# hw/sparc/sun4m_iommu.c
+# sun4m_iommu.c
 sun4m_iommu_mem_readl(uint64_t addr, uint32_t ret) "read reg[0x%"PRIx64"=
] =3D 0x%x"
 sun4m_iommu_mem_writel(uint64_t addr, uint32_t val) "write reg[0x%"PRIx6=
4"] =3D 0x%x"
 sun4m_iommu_mem_writel_ctrl(uint64_t iostart) "iostart =3D 0x%"PRIx64
@@ -16,6 +16,6 @@ sun4m_iommu_page_get_flags(uint64_t pa, uint64_t iopte,=
 uint32_t ret) "get flags
 sun4m_iommu_translate_pa(uint64_t addr, uint64_t pa, uint32_t iopte) "xl=
ate dva 0x%"PRIx64" =3D> pa 0x%"PRIx64" iopte =3D 0x%x"
 sun4m_iommu_bad_addr(uint64_t addr) "bad addr 0x%"PRIx64
=20
-# hw/sparc/leon3.c
+# leon3.c
 leon3_set_irq(int intno) "Set CPU IRQ %d"
 leon3_reset_irq(int intno) "Reset CPU IRQ %d"
diff --git a/hw/sparc64/trace-events b/hw/sparc64/trace-events
index ce597a6e9d..a0b29987d2 100644
--- a/hw/sparc64/trace-events
+++ b/hw/sparc64/trace-events
@@ -1,14 +1,14 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/sparc64/sun4u.c
+# sun4u.c
 ebus_isa_irq_handler(int n, int level) "Set ISA IRQ %d level %d"
=20
-# hw/sparc64/sun4u_iommu.c
+# sun4u_iommu.c
 sun4u_iommu_mem_read(uint64_t addr, uint64_t val, int size) "addr: 0x%"P=
RIx64" val: 0x%"PRIx64" size: %d"
 sun4u_iommu_mem_write(uint64_t addr, uint64_t val, int size) "addr: 0x%"=
PRIx64" val: 0x%"PRIx64" size: %d"
 sun4u_iommu_translate(uint64_t addr, uint64_t trans_addr, uint64_t tte) =
"xlate 0x%"PRIx64" =3D> pa 0x%"PRIx64" tte: 0x%"PRIx64
=20
-# hw/sparc64/sparc64.c
+# sparc64.c
 sparc64_cpu_check_irqs_reset_irq(int intno) "Reset CPU IRQ (current inte=
rrupt 0x%x)"
 sparc64_cpu_check_irqs_noset_irq(uint32_t tl, uint32_t tt, int intno) "N=
ot setting CPU IRQ: TL=3D%d current 0x%x >=3D pending 0x%x"
 sparc64_cpu_check_irqs_set_irq(unsigned int i, int old, int new) "Set CP=
U IRQ %d old=3D0x%x new=3D0x%x"
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 12eb505fee..bdf8390514 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/timer/slavio_timer.c
+# slavio_timer.c
 slavio_timer_get_out(uint64_t limit, uint32_t counthigh, uint32_t count)=
 "limit 0x%"PRIx64" count 0x%x0x%08x"
 slavio_timer_irq(uint32_t counthigh, uint32_t count) "callback: count 0x=
%x0x%08x"
 slavio_timer_mem_readl_invalid(uint64_t addr) "invalid read address 0x%"=
PRIx64
@@ -15,7 +15,7 @@ slavio_timer_mem_writel_mode_counter(unsigned int timer=
_index) "processor %d cha
 slavio_timer_mem_writel_mode_invalid(void) "not system timer"
 slavio_timer_mem_writel_invalid(uint64_t addr) "invalid write address 0x=
%"PRIx64
=20
-# hw/timer/grlib_gptimer.c
+# grlib_gptimer.c
 grlib_gptimer_enable(int id, uint32_t count) "timer:%d set count 0x%x an=
d run"
 grlib_gptimer_disabled(int id, uint32_t config) "timer:%d Timer disable =
config 0x%x"
 grlib_gptimer_restart(int id, uint32_t reload) "timer:%d reload val: 0x%=
x"
@@ -24,13 +24,13 @@ grlib_gptimer_hit(int id) "timer:%d HIT"
 grlib_gptimer_readl(int id, uint64_t addr, uint32_t val) "timer:%d addr =
0x%"PRIx64" 0x%x"
 grlib_gptimer_writel(int id, uint64_t addr, uint32_t val) "timer:%d addr=
 0x%"PRIx64" 0x%x"
=20
-# hw/timer/lm32_timer.c
+# lm32_timer.c
 lm32_timer_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x valu=
e 0x%08x"
 lm32_timer_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value=
 0x%08x"
 lm32_timer_hit(void) "timer hit"
 lm32_timer_irq_state(int level) "irq state %d"
=20
-# hw/timer/milkymist-sysctl.c
+# milkymist-sysctl.c
 milkymist_sysctl_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x=
 value 0x%08x"
 milkymist_sysctl_memory_write(uint32_t addr, uint32_t value) "addr 0x%08=
x value 0x%08x"
 milkymist_sysctl_icap_write(uint32_t value) "value 0x%08x"
@@ -41,7 +41,7 @@ milkymist_sysctl_stop_timer1(void) "Stop timer1"
 milkymist_sysctl_pulse_irq_timer0(void) "Pulse IRQ Timer0"
 milkymist_sysctl_pulse_irq_timer1(void) "Pulse IRQ Timer1"
=20
-# hw/timer/aspeed_timer.c
+# aspeed_timer.c
 aspeed_timer_ctrl_enable(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
 aspeed_timer_ctrl_external_clock(uint8_t i, bool enable) "Timer %" PRIu8=
 ": %d"
 aspeed_timer_ctrl_overflow_interrupt(uint8_t i, bool enable) "Timer %" P=
RIu8 ": %d"
@@ -50,34 +50,34 @@ aspeed_timer_set_ctrl2(uint32_t value) "Value: 0x%" P=
RIx32
 aspeed_timer_set_value(int timer, int reg, uint32_t value) "Timer %d reg=
ister %d: 0x%" PRIx32
 aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From =
0x%" PRIx64 ": of size %u: 0x%" PRIx64
=20
-# hw/timer/armv7m_systick.c
+# armv7m_systick.c
 systick_reload(void) "systick reload"
 systick_timer_tick(void) "systick reload"
 systick_read(uint64_t addr, uint32_t value, unsigned size) "systick read=
 addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 systick_write(uint64_t addr, uint32_t value, unsigned size) "systick wri=
te addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
=20
-# hw/timer/cmsdk_apb_timer.c
+# cmsdk_apb_timer.c
 cmsdk_apb_timer_read(uint64_t offset, uint64_t data, unsigned size) "CMS=
DK APB timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_write(uint64_t offset, uint64_t data, unsigned size) "CM=
SDK APB timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_reset(void) "CMSDK APB timer: reset"
=20
-# hw/timer/cmsdk_apb_dualtimer.c
+# cmsdk_apb_dualtimer.c
 cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data, unsigned size) =
"CMSDK APB dualtimer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %=
u"
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size)=
 "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size=
 %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
=20
-# hw/timer/sun4v-rtc.c
+# sun4v-rtc.c
 sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
 sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
=20
-# hw/timer/xlnx-zynqmp-rtc.c
+# xlnx-zynqmp-rtc.c
 xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min,=
 int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
=20
-# hw/timer/nrf51_timer.c
+# nrf51_timer.c
 nrf51_timer_read(uint64_t addr, uint32_t value, unsigned size) "read add=
r 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 nrf51_timer_write(uint64_t addr, uint32_t value, unsigned size) "write a=
ddr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
=20
-# hw/timer/pl031.c
+# pl031.c
 pl031_irq_state(int level) "irq state %d"
 pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 pl031_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
index f45dcd2209..0b94aa1526 100644
--- a/hw/tpm/trace-events
+++ b/hw/tpm/trace-events
@@ -1,21 +1,21 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/tpm/tpm_crb.c
+# tpm_crb.c
 tpm_crb_mmio_read(uint64_t addr, unsigned size, uint32_t val) "CRB read =
0x" TARGET_FMT_plx " len:%u val: 0x%" PRIx32
 tpm_crb_mmio_write(uint64_t addr, unsigned size, uint32_t val) "CRB writ=
e 0x" TARGET_FMT_plx " len:%u val: 0x%" PRIx32
=20
-# hw/tpm/tpm_passthrough.c
+# tpm_passthrough.c
 tpm_passthrough_handle_request(void *cmd) "processing command %p"
 tpm_passthrough_reset(void) "reset"
=20
-# hw/tpm/tpm_util.c
+# tpm_util.c
 tpm_util_get_buffer_size_hdr_len(uint32_t len, size_t expected) "tpm_res=
p->hdr.len =3D %u, expected =3D %zu"
 tpm_util_get_buffer_size_len(uint32_t len, size_t expected) "tpm_resp->l=
en =3D %u, expected =3D %zu"
 tpm_util_get_buffer_size_hdr_len2(uint32_t len, size_t expected) "tpm2_r=
esp->hdr.len =3D %u, expected =3D %zu"
 tpm_util_get_buffer_size_len2(uint32_t len, size_t expected) "tpm2_resp-=
>len =3D %u, expected =3D %zu"
 tpm_util_get_buffer_size(size_t len) "buffersize of device: %zu"
=20
-# hw/tpm/tpm_emulator.c
+# tpm_emulator.c
 tpm_emulator_set_locality(uint8_t locty) "setting locality to %d"
 tpm_emulator_handle_request(void) "processing TPM command"
 tpm_emulator_probe_caps(uint64_t caps) "capabilities: 0x%"PRIx64
@@ -35,7 +35,7 @@ tpm_emulator_set_state_blobs_done(void) "Done setting s=
tate blobs"
 tpm_emulator_pre_save(void) ""
 tpm_emulator_inst_init(void) ""
=20
-# hw/tpm/tpm_tis.c
+# tpm_tis.c
 tpm_tis_show_buffer(const char *direction, size_t len, const char *buf) =
"direction: %s len: %zu\nbuf: %s"
 tpm_tis_raise_irq(uint32_t irqmask) "Raising IRQ for flag 0x%08x"
 tpm_tis_new_active_locality(uint8_t locty) "Active locality is now %d"
@@ -53,5 +53,5 @@ tpm_tis_mmio_write_lowering_irq(void) "Lowering IRQ"
 tpm_tis_mmio_write_data2send(uint32_t value, unsigned size) "Data to sen=
d to TPM: 0x%08x (size=3D%d)"
 tpm_tis_pre_save(uint8_t locty, uint32_t rw_offset) "locty: %d, rw_offse=
t =3D %u"
=20
-# hw/tpm/tpm_ppi.c
+# tpm_ppi.c
 tpm_ppi_memset(uint8_t *ptr, size_t size) "memset: %p %zu"
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index 99b1e8b8ce..2d3713351c 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -1,16 +1,16 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/usb/core.c
+# core.c
 usb_packet_state_change(int bus, const char *port, int ep, void *p, cons=
t char *o, const char *n) "bus %d, port %s, ep %d, packet %p, state %s ->=
 %s"
 usb_packet_state_fault(int bus, const char *port, int ep, void *p, const=
 char *o, const char *n) "bus %d, port %s, ep %d, packet %p, state %s, ex=
pected %s"
=20
-# hw/usb/bus.c
+# bus.c
 usb_port_claim(int bus, const char *port) "bus %d, port %s"
 usb_port_attach(int bus, const char *port, const char *devspeed, const c=
har *portspeed) "bus %d, port %s, devspeed %s, portspeed %s"
 usb_port_detach(int bus, const char *port) "bus %d, port %s"
 usb_port_release(int bus, const char *port) "bus %d, port %s"
=20
-# hw/usb/hcd-ohci.c
+# hcd-ohci.c
 usb_ohci_iso_td_read_failed(uint32_t addr) "ISO_TD read error at 0x%x"
 usb_ohci_iso_td_head(uint32_t head, uint32_t tail, uint32_t flags, uint3=
2_t bp, uint32_t next, uint32_t be, uint32_t framenum, uint32_t startfram=
e, uint32_t framecount, int rel_frame_num) "ISO_TD ED head 0x%.8x tailp 0=
x%.8x\n0x%.8x 0x%.8x 0x%.8x 0x%.8x\nframe_number 0x%.8x starting_frame 0x=
%.8x\nframe_count  0x%.8x relative %d"
 usb_ohci_iso_td_head_offset(uint32_t o0, uint32_t o1, uint32_t o2, uint3=
2_t o3, uint32_t o4, uint32_t o5, uint32_t o6, uint32_t o7) "0x%.8x 0x%.8=
x 0x%.8x 0x%.8x 0x%.8x 0x%.8x 0x%.8x 0x%.8x"
@@ -67,7 +67,7 @@ usb_ohci_init_time(int64_t frametime, int64_t bittime) =
"usb_bit_time=3D%" PRId64 "
 usb_ohci_die(void) ""
 usb_ohci_async_complete(void) ""
=20
-# hw/usb/hcd-ehci.c
+# hcd-ehci.c
 usb_ehci_reset(void) "=3D=3D=3D RESET =3D=3D=3D"
 usb_ehci_unrealize(void) "=3D=3D=3D UNREALIZE =3D=3D=3D"
 usb_ehci_opreg_read(uint32_t addr, const char *str, uint32_t val) "rd mm=
io 0x%04x [%s] =3D 0x%x"
@@ -100,7 +100,7 @@ usb_ehci_doorbell_ring(void) ""
 usb_ehci_doorbell_ack(void) ""
 usb_ehci_dma_error(void) ""
=20
-# hw/usb/hcd-uhci.c
+# hcd-uhci.c
 usb_uhci_reset(void) "=3D=3D=3D RESET =3D=3D=3D"
 usb_uhci_exit(void) "=3D=3D=3D EXIT =3D=3D=3D"
 usb_uhci_schedule_start(void) ""
@@ -130,7 +130,7 @@ usb_uhci_td_nextqh(uint32_t qh, uint32_t td) "qh 0x%x=
, td 0x%x"
 usb_uhci_td_async(uint32_t qh, uint32_t td) "qh 0x%x, td 0x%x"
 usb_uhci_td_complete(uint32_t qh, uint32_t td) "qh 0x%x, td 0x%x"
=20
-# hw/usb/hcd-xhci.c
+# hcd-xhci.c
 usb_xhci_reset(void) "=3D=3D=3D RESET =3D=3D=3D"
 usb_xhci_exit(void) "=3D=3D=3D EXIT =3D=3D=3D"
 usb_xhci_run(void) ""
@@ -176,7 +176,7 @@ usb_xhci_xfer_error(void *xfer, uint32_t ret) "%p: re=
t %d"
 usb_xhci_unimplemented(const char *item, int nr) "%s (0x%x)"
 usb_xhci_enforced_limit(const char *item) "%s"
=20
-# hw/usb/desc.c
+# desc.c
 usb_desc_device(int addr, int len, int ret) "dev %d query device, len %d=
, ret %d"
 usb_desc_device_qualifier(int addr, int len, int ret) "dev %d query devi=
ce qualifier, len %d, ret %d"
 usb_desc_config(int addr, int index, int len, int ret) "dev %d query con=
fig %d, len %d, ret %d"
@@ -190,7 +190,7 @@ usb_set_interface(int addr, int iface, int alt, int r=
et) "dev %d, interface %d,
 usb_clear_device_feature(int addr, int feature, int ret) "dev %d, featur=
e %d, ret %d"
 usb_set_device_feature(int addr, int feature, int ret) "dev %d, feature =
%d, ret %d"
=20
-# hw/usb/dev-hub.c
+# dev-hub.c
 usb_hub_reset(int addr) "dev %d"
 usb_hub_control(int addr, int request, int value, int index, int length)=
 "dev %d, req 0x%x, value %d, index %d, langth %d"
 usb_hub_get_port_status(int addr, int nr, int status, int changed) "dev =
%d, port %d, status 0x%x, changed 0x%x"
@@ -200,7 +200,7 @@ usb_hub_attach(int addr, int nr) "dev %d, port %d"
 usb_hub_detach(int addr, int nr) "dev %d, port %d"
 usb_hub_status_report(int addr, int status) "dev %d, status 0x%x"
=20
-# hw/usb/dev-uas.c
+# dev-uas.c
 usb_uas_reset(int addr) "dev %d"
 usb_uas_command(int addr, uint16_t tag, int lun, uint32_t lun64_1, uint3=
2_t lun64_2) "dev %d, tag 0x%x, lun %d, lun64 0x%08x-0x%08x"
 usb_uas_response(int addr, uint16_t tag, uint8_t code) "dev %d, tag 0x%x=
, code 0x%x"
@@ -214,7 +214,7 @@ usb_uas_tmf_abort_task(int addr, uint16_t tag, uint16=
_t task_tag) "dev %d, tag 0
 usb_uas_tmf_logical_unit_reset(int addr, uint16_t tag, int lun) "dev %d,=
 tag 0x%x, lun %d"
 usb_uas_tmf_unsupported(int addr, uint16_t tag, uint32_t function) "dev =
%d, tag 0x%x, function 0x%x"
=20
-# hw/usb/dev-mtp.c
+# dev-mtp.c
 usb_mtp_reset(int addr) "dev %d"
 usb_mtp_command(int dev, uint16_t code, uint32_t trans, uint32_t arg0, u=
int32_t arg1, uint32_t arg2, uint32_t arg3, uint32_t arg4) "dev %d, code =
0x%x, trans 0x%x, args 0x%x, 0x%x, 0x%x, 0x%x, 0x%x"
 usb_mtp_success(int dev, uint32_t trans, uint32_t arg0, uint32_t arg1) "=
dev %d, trans 0x%x, args 0x%x, 0x%x"
@@ -239,7 +239,7 @@ usb_mtp_object_free(int dev, uint32_t handle, const c=
har *path) "dev %d, handle
 usb_mtp_add_child(int dev, uint32_t handle, const char *path) "dev %d, h=
andle 0x%x, path %s"
 usb_mtp_file_monitor_event(int dev, const char *path, const char *s) "de=
v %d, path %s event %s"
=20
-# hw/usb/host-libusb.c
+# host-libusb.c
 usb_host_open_started(int bus, int addr) "dev %d:%d"
 usb_host_open_success(int bus, int addr) "dev %d:%d"
 usb_host_open_failure(int bus, int addr) "dev %d:%d"
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 22019728e0..0c38b0c224 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/vfio/pci.c
+# pci.c
 vfio_intx_interrupt(const char *name, char line) " (%s) Pin %c"
 vfio_intx_eoi(const char *name) " (%s) EOI"
 vfio_intx_enable_kvm(const char *name) " (%s) KVM INTx accel enabled"
@@ -49,7 +49,7 @@ vfio_pci_emulated_device_id(const char *name, uint16_t =
val) "%s 0x%04x"
 vfio_pci_emulated_sub_vendor_id(const char *name, uint16_t val) "%s 0x%0=
4x"
 vfio_pci_emulated_sub_device_id(const char *name, uint16_t val) "%s 0x%0=
4x"
=20
-# hw/vfio/pci-quirks.c
+# pci-quirks.c
 vfio_quirk_rom_blacklisted(const char *name, uint16_t vid, uint16_t did)=
 "%s %04x:%04x"
 vfio_quirk_generic_window_address_write(const char *name, const char * r=
egion_name, uint64_t data) "%s %s 0x%"PRIx64
 vfio_quirk_generic_window_data_read(const char *name, const char * regio=
n_name, uint64_t data) "%s %s 0x%"PRIx64
@@ -87,7 +87,7 @@ vfio_pci_igd_opregion_enabled(const char *name) "%s"
 vfio_pci_igd_host_bridge_enabled(const char *name) "%s"
 vfio_pci_igd_lpc_bridge_enabled(const char *name) "%s"
=20
-# hw/vfio/common.c
+# common.c
 vfio_region_write(const char *name, int index, uint64_t addr, uint64_t d=
ata, unsigned size) " (%s:region%d+0x%"PRIx64", 0x%"PRIx64 ", %d)"
 vfio_region_read(char *name, int index, uint64_t addr, unsigned size, ui=
nt64_t data) " (%s:region%d+0x%"PRIx64", %d) =3D 0x%"PRIx64
 vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova=
_end) "iommu %s @ 0x%"PRIx64" - 0x%"PRIx64
@@ -112,7 +112,7 @@ vfio_region_sparse_mmap_entry(int i, unsigned long st=
art, unsigned long end) "sp
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t=
 subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
=20
-# hw/vfio/platform.c
+# platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to g=
roup #%d"
 vfio_platform_realize(char *name, char *compat) "vfio device %s, compat =
=3D %s"
 vfio_platform_eoi(int pin, int fd) "EOI IRQ pin %d (fd=3D%d)"
@@ -124,7 +124,7 @@ vfio_intp_interrupt_set_pending(int index) "irq %d is=
 set PENDING"
 vfio_platform_start_level_irqfd_injection(int index, int fd, int resampl=
efd) "IRQ index=3D%d, fd =3D %d, resamplefd =3D %d"
 vfio_platform_start_edge_irqfd_injection(int index, int fd) "IRQ index=3D=
%d, fd =3D %d"
=20
-# hw/vfio/spapr.c
+# spapr.c
 vfio_prereg_listener_region_add_skip(uint64_t start, uint64_t end) "0x%"=
PRIx64" - 0x%"PRIx64
 vfio_prereg_listener_region_del_skip(uint64_t start, uint64_t end) "0x%"=
PRIx64" - 0x%"PRIx64
 vfio_prereg_register(uint64_t va, uint64_t size, int ret) "va=3D0x%"PRIx=
64" size=3D0x%"PRIx64" ret=3D%d"
@@ -133,7 +133,7 @@ vfio_spapr_create_window(int ps, unsigned int levels,=
 uint64_t ws, uint64_t off)
 vfio_spapr_remove_window(uint64_t off) "offset=3D0x%"PRIx64
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d t=
o liobn fd %d"
=20
-# hw/vfio/display.c
+# display.c
 vfio_display_edid_available(void) ""
 vfio_display_edid_link_up(void) ""
 vfio_display_edid_link_down(void) ""
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 07bcbe9e85..60c649c4bc 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/virtio/vhost.c
+# vhost.c
 vhost_commit(bool started, bool changed) "Started: %d Changed: %d"
 vhost_region_add_section(const char *name, uint64_t gpa, uint64_t size, =
uint64_t host) "%s: 0x%"PRIx64"+0x%"PRIx64" @ 0x%"PRIx64
 vhost_region_add_section_merge(const char *name, uint64_t new_size, uint=
64_t gpa, uint64_t owr) "%s: size: 0x%"PRIx64 " gpa: 0x%"PRIx64 " owr: 0x=
%"PRIx64
@@ -8,7 +8,7 @@ vhost_region_add_section_aligned(const char *name, uint64=
_t gpa, uint64_t size,
 vhost_section(const char *name, int r) "%s:%d"
 vhost_iotlb_miss(void *dev, int step) "%p step %d"
=20
-# hw/virtio/vhost-user.c
+# vhost-user.c
 vhost_user_postcopy_end_entry(void) ""
 vhost_user_postcopy_end_exit(void) ""
 vhost_user_postcopy_fault_handler(const char *name, uint64_t fault_addre=
ss, int nregions) "%s: @0x%"PRIx64" nregions:%d"
@@ -21,7 +21,7 @@ vhost_user_postcopy_waker(const char *rb, uint64_t rb_o=
ffset) "%s + 0x%"PRIx64
 vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
 vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%=
s + 0x%"PRIx64
=20
-# hw/virtio/virtio.c
+# virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned=
 out_num) "elem %p size %zd in_num %u out_num %u"
 virtqueue_fill(void *vq, const void *elem, unsigned int len, unsigned in=
t idx) "vq %p elem %p len %u idx %u"
 virtqueue_flush(void *vq, unsigned int count) "vq %p count %u"
@@ -31,7 +31,7 @@ virtio_notify_irqfd(void *vdev, void *vq) "vdev %p vq %=
p"
 virtio_notify(void *vdev, void *vq) "vdev %p vq %p"
 virtio_set_status(void *vdev, uint8_t val) "vdev %p val %u"
=20
-# hw/virtio/virtio-rng.c
+# virtio-rng.c
 virtio_rng_guest_not_ready(void *rng) "rng %p: guest not ready"
 virtio_rng_cpu_is_stopped(void *rng, int size) "rng %p: cpu is stopped, =
dropping %d bytes"
 virtio_rng_popped(void *rng) "rng %p: elem popped"
@@ -39,7 +39,7 @@ virtio_rng_pushed(void *rng, size_t len) "rng %p: %zd b=
ytes pushed"
 virtio_rng_request(void *rng, size_t size, unsigned quota) "rng %p: %zd =
bytes requested, %u bytes quota left"
 virtio_rng_vm_state_change(void *rng, int running, int state) "rng %p: s=
tate change to running %d state %d"
=20
-# hw/virtio/virtio-balloon.c
+# virtio-balloon.c
 #
 virtio_balloon_bad_addr(uint64_t gpa) "0x%"PRIx64
 virtio_balloon_handle_output(const char *name, uint64_t gpa) "section na=
me: %s gpa: 0x%"PRIx64
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index fee95847df..444d578cf1 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# hw/char/cmsdk_apb_watchdog.c
+# cmsdk_apb_watchdog.c
 cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "=
CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) =
"CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %=
u"
 cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index f6944624b2..bc82ecb1a5 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# include/hw/xen/xen_common.h
+# ../../include/hw/xen/xen_common.h
 xen_default_ioreq_server(void) ""
 xen_ioreq_server_create(uint32_t id) "id: %u"
 xen_ioreq_server_destroy(uint32_t id) "id: %u"
@@ -13,7 +13,7 @@ xen_map_pcidev(uint32_t id, uint8_t bus, uint8_t dev, u=
int8_t func) "id: %u bdf:
 xen_unmap_pcidev(uint32_t id, uint8_t bus, uint8_t dev, uint8_t func) "i=
d: %u bdf: %02x.%02x.%02x"
 xen_domid_restrict(int err) "err: %u"
=20
-# include/hw/xen/xen-bus.c
+# xen-bus.c
 xen_bus_realize(void) ""
 xen_bus_unrealize(void) ""
 xen_bus_enumerate(void) ""
@@ -31,7 +31,7 @@ xen_device_frontend_state(const char *type, char *name,=
 const char *state) "type
 xen_device_frontend_changed(const char *type, char *name) "type: %s name=
: %s"
 xen_device_unplug(const char *type, char *name) "type: %s name: %s"
=20
-# include/hw/xen/xen-bus-helper.c
+# xen-bus-helper.c
 xs_node_create(const char *node) "%s"
 xs_node_destroy(const char *node) "%s"
 xs_node_vprintf(char *path, char *value) "%s %s"
diff --git a/io/trace-events b/io/trace-events
index 07a7bbec6a..378390521e 100644
--- a/io/trace-events
+++ b/io/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# io/task.c
+# task.c
 qio_task_new(void *task, void *source, void *func, void *opaque) "Task n=
ew task=3D%p source=3D%p func=3D%p opaque=3D%p"
 qio_task_complete(void *task) "Task complete task=3D%p"
 qio_task_thread_start(void *task, void *worker, void *opaque) "Task thre=
ad start task=3D%p worker=3D%p opaque=3D%p"
@@ -10,7 +10,7 @@ qio_task_thread_result(void *task) "Task thread result =
task=3D%p"
 qio_task_thread_source_attach(void *task, void *source) "Task thread sou=
rce attach task=3D%p source=3D%p"
 qio_task_thread_source_cancel(void *task, void *source) "Task thread sou=
rce cancel task=3D%p source=3D%p"
=20
-# io/channel-socket.c
+# channel-socket.c
 qio_channel_socket_new(void *ioc) "Socket new ioc=3D%p"
 qio_channel_socket_new_fd(void *ioc, int fd) "Socket new ioc=3D%p fd=3D%=
d"
 qio_channel_socket_connect_sync(void *ioc, void *addr) "Socket connect s=
ync ioc=3D%p addr=3D%p"
@@ -29,11 +29,11 @@ qio_channel_socket_accept(void *ioc) "Socket accept s=
tart ioc=3D%p"
 qio_channel_socket_accept_fail(void *ioc) "Socket accept fail ioc=3D%p"
 qio_channel_socket_accept_complete(void *ioc, void *cioc, int fd) "Socke=
t accept complete ioc=3D%p cioc=3D%p fd=3D%d"
=20
-# io/channel-file.c
+# channel-file.c
 qio_channel_file_new_fd(void *ioc, int fd) "File new fd ioc=3D%p fd=3D%d=
"
 qio_channel_file_new_path(void *ioc, const char *path, int flags, int mo=
de, int fd) "File new fd ioc=3D%p path=3D%s flags=3D%d mode=3D%d fd=3D%d"
=20
-# io/channel-tls.c
+# channel-tls.c
 qio_channel_tls_new_client(void *ioc, void *master, void *creds, const c=
har *hostname) "TLS new client ioc=3D%p master=3D%p creds=3D%p hostname=3D=
%s"
 qio_channel_tls_new_server(void *ioc, void *master, void *creds, const c=
har *aclname) "TLS new client ioc=3D%p master=3D%p creds=3D%p acltname=3D=
%s"
 qio_channel_tls_handshake_start(void *ioc) "TLS handshake start ioc=3D%p=
"
@@ -43,7 +43,7 @@ qio_channel_tls_handshake_complete(void *ioc) "TLS hand=
shake complete ioc=3D%p"
 qio_channel_tls_credentials_allow(void *ioc) "TLS credentials allow ioc=3D=
%p"
 qio_channel_tls_credentials_deny(void *ioc) "TLS credentials deny ioc=3D=
%p"
=20
-# io/channel-websock.c
+# channel-websock.c
 qio_channel_websock_new_server(void *ioc, void *master) "Websock new cli=
ent ioc=3D%p master=3D%p"
 qio_channel_websock_handshake_start(void *ioc) "Websock handshake start =
ioc=3D%p"
 qio_channel_websock_handshake_pending(void *ioc, int status) "Websock ha=
ndshake pending ioc=3D%p status=3D%d"
@@ -58,7 +58,7 @@ qio_channel_websock_payload_decode(void *ioc, uint8_t o=
pcode, size_t payload_rem
 qio_channel_websock_encode(void *ioc, uint8_t opcode, size_t payloadlen,=
 size_t headerlen) "Websocket encoded ioc=3D%p opcode=3D0x%x header-len=3D=
%zu payload-len=3D%zu"
 qio_channel_websock_close(void *ioc) "Websocket close ioc=3D%p"
=20
-# io/channel-command.c
+# channel-command.c
 qio_channel_command_new_pid(void *ioc, int writefd, int readfd, int pid)=
 "Command new pid ioc=3D%p writefd=3D%d readfd=3D%d pid=3D%d"
 qio_channel_command_new_spawn(void *ioc, const char *binary, int flags) =
"Command new spawn ioc=3D%p binary=3D%s flags=3D%d"
 qio_channel_command_abort(void *ioc, int pid) "Command abort ioc=3D%p pi=
d=3D%d"
diff --git a/linux-user/trace-events b/linux-user/trace-events
index 68f36ac8fd..27da07359b 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# linux-user/signal.c
+# signal.c
 user_setup_frame(void *env, uint64_t frame_addr) "env=3D%p frame_addr=3D=
0x%"PRIx64
 user_setup_rt_frame(void *env, uint64_t frame_addr) "env=3D%p frame_addr=
=3D0x%"PRIx64
 user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=3D%p frame_add=
r=3D0x%"PRIx64
diff --git a/migration/trace-events b/migration/trace-events
index 72e3fcb885..9727973b5c 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# migration/savevm.c
+# savevm.c
 qemu_loadvm_state_section(unsigned int section_type) "%d"
 qemu_loadvm_state_section_command(int ret) "%d"
 qemu_loadvm_state_section_partend(uint32_t section_id) "%u"
@@ -53,7 +53,7 @@ vmstate_subsection_save_loop(const char *name, const ch=
ar *sub) "%s/%s"
 vmstate_subsection_save_top(const char *idstr) "%s"
 vmstate_load(const char *idstr, const char *vmsd_name) "%s, %s"
=20
-# migration/vmstate.c
+# vmstate.c
 vmstate_load_field_error(const char *field, int ret) "field \"%s\" load =
failed, ret =3D %d"
 vmstate_load_state(const char *name, int version_id) "%s v%d"
 vmstate_load_state_end(const char *name, const char *reason, int val) "%=
s %s/%d"
@@ -67,10 +67,10 @@ get_qtailq_end(const char *name, const char *reason, =
int val) "%s %s/%d"
 put_qtailq(const char *name, int version_id) "%s v%d"
 put_qtailq_end(const char *name, const char *reason) "%s %s"
=20
-# migration/qemu-file.c
+# qemu-file.c
 qemu_file_fclose(void) ""
=20
-# migration/ram.c
+# ram.c
 get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned lo=
ng page_abs) "%s/0x%" PRIx64 " page_abs=3D0x%lx"
 get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, u=
nsigned long page_abs, int sent) "%s/0x%" PRIx64 " page_abs=3D0x%lx (sent=
=3D%d)"
 migration_bitmap_sync_start(void) ""
@@ -104,7 +104,7 @@ ram_state_resume_prepare(uint64_t v) "%" PRId64
 colo_flush_ram_cache_begin(uint64_t dirty_pages) "dirty_pages %" PRIu64
 colo_flush_ram_cache_end(void) ""
=20
-# migration/migration.c
+# migration.c
 await_return_path_close_on_source_close(void) ""
 await_return_path_close_on_source_joining(void) ""
 migrate_set_state(const char *new_state) "new state %s"
@@ -155,7 +155,7 @@ migration_set_outgoing_channel(void *ioc, const char =
*ioctype, const char *hostn
 mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, in=
t cpu, int received) "addr: 0x%" PRIx64 ", dd: %p, time: %u, cpu: %d, alr=
eady_received: %d"
 mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int =
affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"
=20
-# migration/rdma.c
+# rdma.c
 qemu_rdma_accept_incoming_migration(void) ""
 qemu_rdma_accept_incoming_migration_accepted(void) ""
 qemu_rdma_accept_pin_state(bool pin) "%d"
@@ -217,7 +217,7 @@ rdma_start_incoming_migration_after_rdma_listen(void)=
 ""
 rdma_start_outgoing_migration_after_rdma_connect(void) ""
 rdma_start_outgoing_migration_after_rdma_source_init(void) ""
=20
-# migration/postcopy-ram.c
+# postcopy-ram.c
 postcopy_discard_send_finish(const char *ramblock, int nwords, int ncmds=
) "%s mask words sent=3D%d in %d commands"
 postcopy_discard_send_range(const char *ramblock, unsigned long start, u=
nsigned long length) "%s:%lx/%lx"
 postcopy_cleanup_range(const char *ramblock, void *host_addr, size_t off=
set, size_t length) "%s: %p offset=3D0x%zx length=3D0x%zx"
@@ -247,20 +247,20 @@ ram_save_iterate_big_wait(uint64_t milliconds, int =
iterations) "big wait: %" PRI
 ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteratio=
n %" PRIu64
 get_mem_fault_cpu_index(int cpu, uint32_t pid) "cpu: %d, pid: %u"
=20
-# migration/exec.c
+# exec.c
 migration_exec_outgoing(const char *cmd) "cmd=3D%s"
 migration_exec_incoming(const char *cmd) "cmd=3D%s"
=20
-# migration/fd.c
+# fd.c
 migration_fd_outgoing(int fd) "fd=3D%d"
 migration_fd_incoming(int fd) "fd=3D%d"
=20
-# migration/socket.c
+# socket.c
 migration_socket_incoming_accepted(void) ""
 migration_socket_outgoing_connected(const char *hostname) "hostname=3D%s=
"
 migration_socket_outgoing_error(const char *err) "error=3D%s"
=20
-# migration/tls.c
+# tls.c
 migration_tls_outgoing_handshake_start(const char *hostname) "hostname=3D=
%s"
 migration_tls_outgoing_handshake_error(const char *err) "err=3D%s"
 migration_tls_outgoing_handshake_complete(void) ""
@@ -268,13 +268,13 @@ migration_tls_incoming_handshake_start(void) ""
 migration_tls_incoming_handshake_error(const char *err) "err=3D%s"
 migration_tls_incoming_handshake_complete(void) ""
=20
-# migration/colo.c
+# colo.c
 colo_vm_state_change(const char *old, const char *new) "Change '%s' =3D>=
 '%s'"
 colo_send_message(const char *msg) "Send '%s' message"
 colo_receive_message(const char *msg) "Receive '%s' message"
 colo_failover_set_state(const char *new_state) "new state %s"
=20
-# migration/block-dirty-bitmap.c
+# block-dirty-bitmap.c
 send_bitmap_header_enter(void) ""
 send_bitmap_bits(uint32_t flags, uint64_t start_sector, uint32_t nr_sect=
ors, uint64_t data_size) "flags: 0x%x, start_sector: %" PRIu64 ", nr_sect=
ors: %" PRIu32 ", data_size: %" PRIu64
 dirty_bitmap_save_iterate(int in_postcopy) "in postcopy: %d"
diff --git a/nbd/trace-events b/nbd/trace-events
index 6db8375c3e..640f86a3b4 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# nbd/client.c
+# client.c
 nbd_send_option_request(uint32_t opt, const char *name, uint32_t len) "S=
ending option request %" PRIu32" (%s), len %" PRIu32
 nbd_receive_option_reply(uint32_t option, const char *optname, uint32_t =
type, const char *typename, uint32_t length) "Received option reply %" PR=
Iu32" (%s), type %" PRIu32" (%s), len %" PRIu32
 nbd_server_error_msg(uint32_t err, const char *type, const char *msg) "s=
erver reported error 0x%" PRIx32 " (%s) with additional message: %s"
@@ -35,10 +35,10 @@ nbd_send_request(uint64_t from, uint32_t len, uint64_=
t handle, uint16_t flags, u
 nbd_receive_simple_reply(int32_t error, const char *errname, uint64_t ha=
ndle) "Got simple reply: { .error =3D %" PRId32 " (%s), handle =3D %" PRI=
u64" }"
 nbd_receive_structured_reply_chunk(uint16_t flags, uint16_t type, const =
char *name, uint64_t handle, uint32_t length) "Got structured reply chunk=
: { flags =3D 0x%" PRIx16 ", type =3D %d (%s), handle =3D %" PRIu64 ", le=
ngth =3D %" PRIu32 " }"
=20
-# nbd/common.c
+# common.c
 nbd_unknown_error(int err) "Squashing unexpected error %d to EINVAL"
=20
-# nbd/server.c
+# server.c
 nbd_negotiate_send_rep_len(uint32_t opt, const char *optname, uint32_t t=
ype, const char *typename, uint32_t len) "Reply opt=3D%" PRIu32 " (%s), t=
ype=3D%" PRIu32 " (%s), len=3D%" PRIu32
 nbd_negotiate_send_rep_err(const char *msg) "sending error message \"%s\=
""
 nbd_negotiate_send_rep_list(const char *name, const char *desc) "Adverti=
sing export name '%s' description '%s'"
diff --git a/net/trace-events b/net/trace-events
index 3417ac05b0..a7937f3f3a 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -1,15 +1,15 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# net/announce.c
+# announce.c
 qemu_announce_self_iter(const char *mac) "%s"
=20
-# net/vhost-user.c
+# vhost-user.c
 vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
=20
-# net/colo.c
+# colo.c
 colo_proxy_main(const char *chr) ": %s"
=20
-# net/colo-compare.c
+# colo-compare.c
 colo_compare_main(const char *chr) ": %s"
 colo_compare_udp_miscompare(const char *sta, int size) ": %s =3D %d"
 colo_compare_icmp_miscompare(const char *sta, int size) ": %s =3D %d"
@@ -18,7 +18,7 @@ colo_old_packet_check_found(int64_t old_time) "%" PRId6=
4
 colo_compare_miscompare(void) ""
 colo_compare_tcp_info(const char *pkt, uint32_t seq, uint32_t ack, int h=
dlen, int pdlen, int offset, int flags) "%s: seq/ack=3D %u/%u hdlen=3D %d=
 pdlen=3D %d offset=3D %d flags=3D%d\n"
=20
-# net/filter-rewriter.c
+# filter-rewriter.c
 colo_filter_rewriter_debug(void) ""
 colo_filter_rewriter_pkt_info(const char *func, const char *src, const c=
har *dst, uint32_t seq, uint32_t ack, uint32_t flag) "%s: src/dst: %s/%s =
p: seq/ack=3D%u/%u  flags=3D0x%x\n"
 colo_filter_rewriter_conn_offset(uint32_t offset) ": offset=3D%u\n"
diff --git a/qapi/trace-events b/qapi/trace-events
index b123c5e302..5eb4afa110 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# qapi/qapi-visit-core.c
+# qapi-visit-core.c
 visit_free(void *v) "v=3D%p"
 visit_complete(void *v, void *opaque) "v=3D%p opaque=3D%p"
=20
diff --git a/qom/trace-events b/qom/trace-events
index 5d86fbf019..945205bd10 100644
--- a/qom/trace-events
+++ b/qom/trace-events
@@ -1,5 +1,5 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# qom/object.c
+# object.c
 object_dynamic_cast_assert(const char *type, const char *target, const c=
har *file, int line, const char *func) "%s->%s (%s:%d:%s)"
 object_class_dynamic_cast_assert(const char *type, const char *target, c=
onst char *file, int line, const char *func) "%s->%s (%s:%d:%s)"
diff --git a/scsi/trace-events b/scsi/trace-events
index 499098e50b..6dbfeae790 100644
--- a/scsi/trace-events
+++ b/scsi/trace-events
@@ -1,5 +1,5 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# scsi/pr-manager.c
+# pr-manager.c
 pr_manager_execute(int fd, int cmd, int sa) "fd=3D%d cmd=3D0x%02x servic=
e action=3D0x%02x"
 pr_manager_run(int fd, int cmd, int sa) "fd=3D%d cmd=3D0x%02x service ac=
tion=3D0x%02x"
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 6b759f9d4f..41c63d7570 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# target/arm/helper.c
+# helper.c
 arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: ti=
mer %d irqstate %d next tick 0x%" PRIx64
 arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer =
disabled"
 arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d va=
lue 0x%" PRIx64
@@ -9,5 +9,5 @@ arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write=
: timer %d value 0x%" P
 arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMA=
SK toggle, new irqstate %d"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx6=
4
=20
-# target/arm/kvm.c
+# kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova =3D 0x%"P=
RIx64" is translated into 0x%"PRIx64
diff --git a/target/hppa/trace-events b/target/hppa/trace-events
index 80dae5bd8b..0731ce7ce1 100644
--- a/target/hppa/trace-events
+++ b/target/hppa/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# target/hppa/mem_helper.c
+# mem_helper.c
 disable hppa_tlb_flush_ent(void *env, void *ent, uint64_t va_b, uint64_t=
 va_e, uint64_t pa) "env=3D%p ent=3D%p va_b=3D0x%lx va_e=3D0x%lx pa=3D0x%=
lx"
 disable hppa_tlb_find_entry(void *env, void *ent, int valid, uint64_t va=
_b, uint64_t va_e, uint64_t pa) "env=3D%p ent=3D%p valid=3D%d va_b=3D0x%l=
x va_e=3D0x%lx pa=3D0x%lx"
 disable hppa_tlb_find_entry_not_found(void *env, uint64_t addr) "env=3D%=
p addr=3D%08lx"
@@ -14,5 +14,5 @@ disable hppa_tlb_ptlbe(void *env) "env=3D%p"
 disable hppa_tlb_lpa_success(void *env, uint64_t addr, uint64_t phys) "e=
nv=3D%p addr=3D0x%lx phys=3D0x%lx"
 disable hppa_tlb_lpa_failed(void *env, uint64_t addr) "env=3D%p addr=3D0=
x%lx"
=20
-# target/hppa/op_helper.c
+# op_helper.c
 disable hppa_tlb_probe(uint64_t addr, int level, int want) "addr=3D0x%lx=
 level=3D%d want=3D%d"
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 6a19a69af5..789c700d4a 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# target/i386/kvm.c
+# kvm.c
 kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt fo=
r GSI %" PRIu32
 kvm_x86_add_msi_route(int virq) "Adding route entry for virq %d"
 kvm_x86_remove_msi_route(int virq) "Removing route entry for virq %d"
 kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
=20
-# target/i386/sev.c
+# sev.c
 kvm_sev_init(void) ""
 kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zu"
 kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%z=
u"
diff --git a/target/mips/trace-events b/target/mips/trace-events
index 05eafd7870..ba87fe6062 100644
--- a/target/mips/trace-events
+++ b/target/mips/trace-events
@@ -1,5 +1,5 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# target/mips/translate.c
+# translate.c
 mips_translate_c0(const char *instr, const char *rn, int reg, int sel) "=
%s %s (reg %d sel %d)"
 mips_translate_tr(const char *instr, int rt, int u, int sel, int h) "%s =
(reg %d u %d sel %d h %d)"
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 35ee898566..3858f97dff 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -1,5 +1,5 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# target/ppc/kvm.c
+# kvm.c
 kvm_failed_spr_set(int str, const char *msg) "Warning: Unable to set SPR=
 %d to KVM: %s"
 kvm_failed_spr_get(int str, const char *msg) "Warning: Unable to retriev=
e SPR %d from KVM: %s"
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index e509b08799..fda1ee8220 100644
--- a/target/s390x/trace-events
+++ b/target/s390x/trace-events
@@ -1,25 +1,25 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# target/s390x/mmu_helper.c
+# mmu_helper.c
 get_skeys_nonzero(int rc) "SKEY: Call to get_skeys unexpectedly returned=
 %d"
 set_skeys_nonzero(int rc) "SKEY: Call to set_skeys unexpectedly returned=
 %d"
=20
-# target/s390x/ioinst.c
+# ioinst.c
 ioinst(const char *insn) "IOINST: %s"
 ioinst_sch_id(const char *insn, int cssid, int ssid, int schid) "IOINST:=
 %s (%x.%x.%04x)"
 ioinst_chp_id(const char *insn, int cssid, int chpid) "IOINST: %s (%x.%0=
2x)"
 ioinst_chsc_cmd(uint16_t cmd, uint16_t len) "IOINST: chsc command 0x%04x=
, len 0x%04x"
=20
-# target/s390x/kvm.c
+# kvm.c
 kvm_enable_cmma(int rc) "CMMA: enabling with result code %d"
 kvm_clear_cmma(int rc) "CMMA: clearing with result code %d"
 kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) =
"Warning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
 kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datam=
atch) "fd: %d sch: @0x%x assign: %d vq: %d"
=20
-# target/s390x/cpu.c
+# cpu.c
 cpu_set_state(int cpu_index, uint8_t state) "setting cpu %d state to %" =
PRIu8
 cpu_halt(int cpu_index) "halting cpu %d"
 cpu_unhalt(int cpu_index) "unhalting cpu %d"
=20
-# target/s390x/sigp.c
+# sigp.c
 sigp_finished(uint8_t order, int cpu_index, int dst_index, int cc) "SIGP=
: Finished order %u on cpu %d -> cpu %d with cc=3D%d"
diff --git a/target/sparc/trace-events b/target/sparc/trace-events
index 764b1e5a02..6a064e2327 100644
--- a/target/sparc/trace-events
+++ b/target/sparc/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# target/sparc/mmu_helper.c
+# mmu_helper.c
 mmu_helper_dfault(uint64_t address, uint64_t context, int mmu_idx, uint3=
2_t tl) "DFAULT at 0x%"PRIx64" context 0x%"PRIx64" mmu_idx=3D%d tl=3D%d"
 mmu_helper_dprot(uint64_t address, uint64_t context, int mmu_idx, uint32=
_t tl) "DPROT at 0x%"PRIx64" context 0x%"PRIx64" mmu_idx=3D%d tl=3D%d"
 mmu_helper_dmiss(uint64_t address, uint64_t context) "DMISS at 0x%"PRIx6=
4" context 0x%"PRIx64
@@ -10,16 +10,16 @@ mmu_helper_get_phys_addr_code(uint32_t tl, int mmu_id=
x, uint64_t prim_context, u
 mmu_helper_get_phys_addr_data(uint32_t tl, int mmu_idx, uint64_t prim_co=
ntext, uint64_t sec_context, uint64_t address) "tl=3D%d mmu_idx=3D%d prim=
ary context=3D0x%"PRIx64" secondary context=3D0x%"PRIx64" address=3D0x%"P=
RIx64
 mmu_helper_mmu_fault(uint64_t address, uint64_t paddr, int mmu_idx, uint=
32_t tl, uint64_t prim_context, uint64_t sec_context) "Translate at 0x%"P=
RIx64" -> 0x%"PRIx64", mmu_idx=3D%d tl=3D%d primary context=3D0x%"PRIx64"=
 secondary context=3D0x%"PRIx64
=20
-# target/sparc/int64_helper.c
+# int64_helper.c
 int_helper_set_softint(uint32_t softint) "new 0x%08x"
 int_helper_clear_softint(uint32_t softint) "new 0x%08x"
 int_helper_write_softint(uint32_t softint) "new 0x%08x"
=20
-# target/sparc/int32_helper.c
+# int32_helper.c
 int_helper_icache_freeze(void) "Instruction cache: freeze"
 int_helper_dcache_freeze(void) "Data cache: freeze"
=20
-# target/sparc/win_helper.c
+# win_helper.c
 win_helper_gregset_error(uint32_t pstate) "ERROR in get_gregset: active =
pstate bits=3D0x%x"
 win_helper_switch_pstate(uint32_t pstate_regs, uint32_t new_pstate_regs)=
 "change_pstate: switching regs old=3D0x%x new=3D0x%x"
 win_helper_no_switch_pstate(uint32_t new_pstate_regs) "change_pstate: re=
gs new=3D0x%x (unchanged)"
diff --git a/ui/trace-events b/ui/trace-events
index eb4bf7f00d..e414bee75a 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -1,6 +1,6 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# ui/console.c
+# console.c
 console_gfx_new(void) ""
 console_gfx_reuse(int index) "%d"
 console_gfx_close(int index) "%d"
@@ -17,7 +17,7 @@ displaychangelistener_register(void *dcl, const char *n=
ame) "%p [ %s ]"
 displaychangelistener_unregister(void *dcl, const char *name) "%p [ %s ]=
"
 ppm_save(const char *filename, void *display_surface) "%s surface=3D%p"
=20
-# ui/gtk.c
+# gtk.c
 gd_switch(const char *tab, int width, int height) "tab=3D%s, width=3D%d,=
 height=3D%d"
 gd_update(const char *tab, int x, int y, int w, int h) "tab=3D%s, x=3D%d=
, y=3D%d, w=3D%d, h=3D%d"
 gd_key_event(const char *tab, int gdk_keycode, int qkeycode, const char =
*action) "tab=3D%s, translated GDK keycode %d to QKeyCode %d (%s)"
@@ -25,7 +25,7 @@ gd_grab(const char *tab, const char *device, const char=
 *reason) "tab=3D%s, dev=3D%s
 gd_ungrab(const char *tab, const char *device) "tab=3D%s, dev=3D%s"
 gd_keymap_windowing(const char *name) "backend=3D%s"
=20
-# ui/vnc.c
+# vnc.c
 vnc_key_guest_leds(bool caps, bool num, bool scroll) "caps %d, num %d, s=
croll %d"
 vnc_key_map_init(const char *layout) "%s"
 vnc_key_event_ext(bool down, int sym, int keycode, const char *name) "do=
wn %d, sym 0x%x, keycode 0x%x [%s]"
@@ -61,7 +61,7 @@ vnc_auth_sasl_username(void *state, const char *name) "=
VNC client auth SASL user
 vnc_auth_sasl_acl(void *state, int allow) "VNC client auth SASL ACL stat=
e=3D%p allow=3D%d"
=20
=20
-# ui/input.c
+# input.c
 input_event_key_number(int conidx, int number, const char *qcode, bool d=
own) "con %d, key number 0x%x [%s], down %d"
 input_event_key_qcode(int conidx, const char *qcode, bool down) "con %d,=
 key qcode %s, down %d"
 input_event_btn(int conidx, const char *btn, bool down) "con %d, button =
%s, down %d"
@@ -70,7 +70,7 @@ input_event_abs(int conidx, const char *axis, int value=
) "con %d, axis %s, value
 input_event_sync(void) ""
 input_mouse_mode(int absolute) "absolute %d"
=20
-# ui/spice-display.c
+# spice-display.c
 qemu_spice_add_memslot(int qid, uint32_t slot_id, unsigned long virt_sta=
rt, unsigned long virt_end, int async) "%d %u: host virt 0x%lx - 0x%lx as=
ync=3D%d"
 qemu_spice_del_memslot(int qid, uint32_t gid, uint32_t slot_id) "%d gid=3D=
%u sid=3D%u"
 qemu_spice_create_primary_surface(int qid, uint32_t sid, void *surface, =
int async) "%d sid=3D%u surface=3D%p async=3D%d"
@@ -90,12 +90,12 @@ qemu_spice_gl_forward_dmabuf(int qid, uint32_t width,=
 uint32_t height) "%d %dx%d
 qemu_spice_gl_render_dmabuf(int qid, uint32_t width, uint32_t height) "%=
d %dx%d"
 qemu_spice_gl_update(int qid, uint32_t x, uint32_t y, uint32_t w, uint32=
_t h) "%d +%d+%d %dx%d"
=20
-# ui/keymaps.c
+# keymaps.c
 keymap_parse(const char *file) "file %s"
 keymap_add(int sym, int code, const char *line) "sym=3D0x%04x code=3D0x%=
04x (line: %s)"
 keymap_unmapped(int sym) "sym=3D0x%04x"
=20
-# ui/x_keymap.c
+# x_keymap.c
 xkeymap_extension(const char *name) "extension '%s'"
 xkeymap_vendor(const char *name) "vendor '%s'"
 xkeymap_keycodes(const char *name) "keycodes '%s'"
diff --git a/util/trace-events b/util/trace-events
index ff19b253e2..d1309a9ccd 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -1,27 +1,27 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
-# util/aio-posix.c
+# aio-posix.c
 run_poll_handlers_begin(void *ctx, int64_t max_ns, int64_t timeout) "ctx=
 %p max_ns %"PRId64 " timeout %"PRId64
 run_poll_handlers_end(void *ctx, bool progress, int64_t timeout) "ctx %p=
 progress %d new timeout %"PRId64
 poll_shrink(void *ctx, int64_t old, int64_t new) "ctx %p old %"PRId64" n=
ew %"PRId64
 poll_grow(void *ctx, int64_t old, int64_t new) "ctx %p old %"PRId64" new=
 %"PRId64
=20
-# util/async.c
+# async.c
 aio_co_schedule(void *ctx, void *co) "ctx %p co %p"
 aio_co_schedule_bh_cb(void *ctx, void *co) "ctx %p co %p"
=20
-# util/thread-pool.c
+# thread-pool.c
 thread_pool_submit(void *pool, void *req, void *opaque) "pool %p req %p =
opaque %p"
 thread_pool_complete(void *pool, void *req, void *opaque, int ret) "pool=
 %p req %p opaque %p ret %d"
 thread_pool_cancel(void *req, void *opaque) "req %p opaque %p"
=20
-# util/buffer.c
+# buffer.c
 buffer_resize(const char *buf, size_t olen, size_t len) "%s: old %zd, ne=
w %zd"
 buffer_move_empty(const char *buf, size_t len, const char *from) "%s: %z=
d bytes from %s"
 buffer_move(const char *buf, size_t len, const char *from) "%s: %zd byte=
s from %s"
 buffer_free(const char *buf, size_t len) "%s: capacity %zd"
=20
-# util/filemonitor.c
+# filemonitor.c
 qemu_file_monitor_add_watch(void *mon, const char *dirpath, const char *=
filename, void *cb, void *opaque, int id) "File monitor %p add watch dir=3D=
'%s' file=3D'%s' cb=3D%p opaque=3D%p id=3D%u"
 qemu_file_monitor_remove_watch(void *mon, const char *dirpath, int id) "=
File monitor %p remove watch dir=3D'%s' id=3D%u"
 qemu_file_monitor_new(void *mon, int fd) "File monitor %p created fd=3D%=
d"
@@ -30,12 +30,12 @@ qemu_file_monitor_disable_watch(void *mon, const char=
 *dirpath, int id) "Fle mon
 qemu_file_monitor_event(void *mon, const char *dirpath, const char *file=
name, int mask, unsigned int id) "File monitor %p event dir=3D'%s' file=3D=
'%s' mask=3D0x%x id=3D%u"
 qemu_file_monitor_dispatch(void *mon, const char *dirpath, const char *f=
ilename, int ev, void *cb, void *opaque, unsigned int id) "File monitor %=
p dispatch dir=3D'%s' file=3D'%s' ev=3D%d cb=3D%p opaque=3D%p id=3D%u"
=20
-# util/qemu-coroutine.c
+# qemu-coroutine.c
 qemu_aio_coroutine_enter(void *ctx, void *from, void *to, void *opaque) =
"ctx %p from %p to %p opaque %p"
 qemu_coroutine_yield(void *from, void *to) "from %p to %p"
 qemu_coroutine_terminate(void *co) "self %p"
=20
-# util/qemu-coroutine-lock.c
+# qemu-coroutine-lock.c
 qemu_co_queue_run_restart(void *co) "co %p"
 qemu_co_mutex_lock_uncontended(void *mutex, void *self) "mutex %p self %=
p"
 qemu_co_mutex_lock_entry(void *mutex, void *self) "mutex %p self %p"
@@ -43,19 +43,19 @@ qemu_co_mutex_lock_return(void *mutex, void *self) "m=
utex %p self %p"
 qemu_co_mutex_unlock_entry(void *mutex, void *self) "mutex %p self %p"
 qemu_co_mutex_unlock_return(void *mutex, void *self) "mutex %p self %p"
=20
-# util/oslib-win32.c
-# util/oslib-posix.c
+# oslib-posix.c
+# oslib-win32.c
 qemu_memalign(size_t alignment, size_t size, void *ptr) "alignment %zu s=
ize %zu ptr %p"
 qemu_anon_ram_alloc(size_t size, void *ptr) "size %zu ptr %p"
 qemu_vfree(void *ptr) "ptr %p"
 qemu_anon_ram_free(void *ptr, size_t size) "ptr %p size %zu"
=20
-# util/hbitmap.c
+# hbitmap.c
 hbitmap_iter_skip_words(const void *hb, void *hbi, uint64_t pos, unsigne=
d long cur) "hb %p hbi %p pos %"PRId64" cur 0x%lx"
 hbitmap_reset(void *hb, uint64_t start, uint64_t count, uint64_t sbit, u=
int64_t ebit) "hb %p items %"PRIu64",%"PRIu64" bits %"PRIu64"..%"PRIu64
 hbitmap_set(void *hb, uint64_t start, uint64_t count, uint64_t sbit, uin=
t64_t ebit) "hb %p items %"PRIu64",%"PRIu64" bits %"PRIu64"..%"PRIu64
=20
-# util/lockcnt.c
+# lockcnt.c
 lockcnt_fast_path_attempt(const void *lockcnt, int expected, int new) "l=
ockcnt %p fast path %d->%d"
 lockcnt_fast_path_success(const void *lockcnt, int expected, int new) "l=
ockcnt %p fast path %d->%d succeeded"
 lockcnt_unlock_attempt(const void *lockcnt, int expected, int new) "lock=
cnt %p unlock %d->%d"
@@ -65,12 +65,12 @@ lockcnt_futex_wait(const void *lockcnt, int val) "loc=
kcnt %p waiting on %d"
 lockcnt_futex_wait_resume(const void *lockcnt, int new) "lockcnt %p afte=
r wait: %d"
 lockcnt_futex_wake(const void *lockcnt) "lockcnt %p waking up one waiter=
"
=20
-# util/qemu-thread.c
+# qemu-thread.c
 qemu_mutex_lock(void *mutex, const char *file, const int line) "waiting =
on mutex %p (%s:%d)"
 qemu_mutex_locked(void *mutex, const char *file, const int line) "taken =
mutex %p (%s:%d)"
 qemu_mutex_unlock(void *mutex, const char *file, const int line) "releas=
ed mutex %p (%s:%d)"
=20
-# util/vfio-helpers.c
+# vfio-helpers.c
 qemu_vfio_dma_reset_temporary(void *s) "s %p"
 qemu_vfio_ram_block_added(void *s, void *p, size_t size) "s %p host %p s=
ize 0x%zx"
 qemu_vfio_ram_block_removed(void *s, void *p, size_t size) "s %p host %p=
 size 0x%zx"
--=20
2.20.1


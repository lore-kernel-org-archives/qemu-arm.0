Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp161483wru;
        Fri, 3 Aug 2018 07:52:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcs9uIEnK3QMA+t7Dbtwv9nvbOl9lpoPtLayg65EVE0KZ/on/WmHVfuDd9M25oEMtmIrEhx
X-Received: by 2002:a0c:9666:: with SMTP id 35-v6mr3752948qvy.137.1533307931859;
        Fri, 03 Aug 2018 07:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307931; cv=none;
        d=google.com; s=arc-20160816;
        b=FeIbh7+lB1ZDZ89UAjIH/9I45hgeuB5SyoM/44jr+1M6GrBlRZ19nR6pz4ttJgaZDA
         d/lcS/EyaCIMIkOTw67a4NmdmNqyy8gc283TjvH4TujIKtaN7JU7q6RCD7KtiHivR+X8
         7JjoIhey9gqaFGdqf61g3GsPDiJfGduE8KivQ6v5Y5RdmzGS0WEagk50xk4pdtXZX5y1
         aDSCcThQ6WfMiRtT+59nSISlyXmVsNXfo3dQ7SGcNQCaaXIlygvkdx8HR4gv+ox7876e
         4SdCRzSTNjHPmuKJZW1NwD+rT9JvXfP7iIiMSOfJCtq17CBC5CnXCebf1iMZIdpAcVDb
         z4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8GCQtZpo00qbQy4gHDTlDboRHMpzTCfbS9CPZiqFbwk=;
        b=nbQBGJAsKGWHW/AoUSUD2i4i9bxovgfMviKPGIX6+yGUk9o35eu5o4pAfmde5+Qg4t
         EI6f6oRyMUlf3wnRb94gtSJSjZIqQDCbS3Uozdwv/079IB2yYK/U53jNRY7TVffsVZBE
         /Zb2a3z/J7WMIU9o5wMOcSFYfzMD5BviIoyq4bOougEF811umHKYfRsizwlnzJAP7pY7
         Y0Q+KX7vo9w2Mgd8yegPVQ++OsD7FtB0RWq+1jqnEPausNd9/jIYAxX6/pKeZ4/2G1P8
         XcpJz+6rdGBC7sW0kdgMmXM2ctei/PpL3mpMdmmut1OGU6COV7PpL+iKUG21BpkodQHX
         kTQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p37-v6si2078804qtb.325.2018.08.03.07.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 07:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flbR5-0006cH-Bu
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 10:52:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMi-0002ji-JE
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMg-0007h2-Ji
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56234 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1flbMg-0007go-Cz; Fri, 03 Aug 2018 10:47:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC48740216FB;
	Fri,  3 Aug 2018 14:47:37 +0000 (UTC)
Received: from localhost (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB57215670D;
	Fri,  3 Aug 2018 14:47:37 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  3 Aug 2018 15:47:20 +0100
Message-Id: <20180803144721.17036-6-stefanha@redhat.com>
In-Reply-To: <20180803144721.17036-1-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 03 Aug 2018 14:47:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 03 Aug 2018 14:47:37 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 5/6] loader: Implement .hex file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tK3O+7i3F45Q

From: Su Hang <suhang16@mails.ucas.ac.cn>

This patch adds Intel Hexadecimal Object File format support to the
generic loader device.  The file format specification is available here:
http://www.piclist.com/techref/fileext/hex/intel.htm

This file format is often used with microcontrollers such as the
micro:bit, Arduino, STM32, etc.  Users expect to be able to run .hex
files directly with without first converting them to ELF.  Most
micro:bit code is developed in web-based IDEs without direct user access
to binutils so it is important for QEMU to handle this file format
natively.

Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/loader.h      |  12 ++
 hw/core/generic-loader.c |   4 +
 hw/core/loader.c         | 243 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 5235f119a3..3c112975f4 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -28,6 +28,18 @@ ssize_t load_image_size(const char *filename, void *addr, size_t size);
 int load_image_targphys_as(const char *filename,
                            hwaddr addr, uint64_t max_sz, AddressSpace *as);
 
+/**load_targphys_hex_as:
+ * @filename: Path to the .hex file
+ * @entry: Store the entry point given by the .hex file
+ * @as: The AddressSpace to load the .hex file to. The value of
+ *      address_space_memory is used if nothing is supplied here.
+ *
+ * Load a fixed .hex file into memory.
+ *
+ * Returns the size of the loaded .hex file on success, -1 otherwise.
+ */
+int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
+
 /** load_image_targphys:
  * Same as load_image_targphys_as(), but doesn't allow the caller to specify
  * an AddressSpace.
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index cb0e68486d..fde32cbda1 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -147,6 +147,10 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
                 size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,
                                       as);
             }
+
+            if (size < 0) {
+                size = load_targphys_hex_as(s->file, &entry, as);
+            }
         }
 
         if (size < 0 || s->force_raw) {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 612420b870..072bf8b434 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1321,3 +1321,246 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict)
         }
     }
 }
+
+typedef enum HexRecord HexRecord;
+enum HexRecord {
+    DATA_RECORD = 0,
+    EOF_RECORD,
+    EXT_SEG_ADDR_RECORD,
+    START_SEG_ADDR_RECORD,
+    EXT_LINEAR_ADDR_RECORD,
+    START_LINEAR_ADDR_RECORD,
+};
+
+#define DATA_FIELD_MAX_LEN 0xff
+#define LEN_EXCEPT_DATA 0x5
+/* 0x5 = sizeof(byte_count) + sizeof(address) + sizeof(record_type) +
+ *       sizeof(checksum) */
+typedef struct {
+    uint8_t byte_count;
+    uint16_t address;
+    uint8_t record_type;
+    uint8_t data[DATA_FIELD_MAX_LEN];
+    uint8_t checksum;
+} HexLine;
+
+/* return 0 or -1 if error */
+static bool parse_record(HexLine *line, uint8_t *our_checksum, const uint8_t c,
+                         uint32_t *index, const bool in_process)
+{
+    /* +-------+---------------+-------+---------------------+--------+
+     * | byte  |               |record |                     |        |
+     * | count |    address    | type  |        data         |checksum|
+     * +-------+---------------+-------+---------------------+--------+
+     * ^       ^               ^       ^                     ^        ^
+     * |1 byte |    2 bytes    |1 byte |     0-255 bytes     | 1 byte |
+     */
+    uint8_t value = 0;
+    uint32_t idx = *index;
+    /* ignore space */
+    if (g_ascii_isspace(c)) {
+        return true;
+    }
+    if (!g_ascii_isxdigit(c) || !in_process) {
+        return false;
+    }
+    value = g_ascii_xdigit_value(c);
+    value = idx & 0x1 ? value & 0xf : value << 4;
+    if (idx < 2) {
+        line->byte_count |= value;
+    } else if (2 <= idx && idx < 6) {
+        line->address <<= 4;
+        line->address += g_ascii_xdigit_value(c);
+    } else if (6 <= idx && idx < 8) {
+        line->record_type |= value;
+    } else if (8 <= idx && idx < 8 + 2 * line->byte_count) {
+        line->data[(idx - 8) >> 1] |= value;
+    } else if (8 + 2 * line->byte_count <= idx &&
+               idx < 10 + 2 * line->byte_count) {
+        line->checksum |= value;
+    } else {
+        return false;
+    }
+    *our_checksum += value;
+    ++(*index);
+    return true;
+}
+
+typedef struct {
+    const char *filename;
+    HexLine line;
+    uint8_t *bin_buf;
+    hwaddr *start_addr;
+    int total_size;
+    uint32_t next_address_to_write;
+    uint32_t current_address;
+    uint32_t current_rom_index;
+    uint32_t rom_start_address;
+    AddressSpace *as;
+} HexParser;
+
+/* return size or -1 if error */
+static int handle_record_type(HexParser *parser)
+{
+    HexLine *line = &(parser->line);
+    switch (line->record_type) {
+    case DATA_RECORD:
+        parser->current_address =
+            (parser->next_address_to_write & 0xffff0000) | line->address;
+        /* verify this is a contiguous block of memory */
+        if (parser->current_address != parser->next_address_to_write) {
+            if (parser->current_rom_index != 0) {
+                rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
+                                      parser->current_rom_index,
+                                      parser->rom_start_address, parser->as);
+            }
+            parser->rom_start_address = parser->current_address;
+            parser->current_rom_index = 0;
+        }
+
+        /* copy from line buffer to output bin_buf */
+        memcpy(parser->bin_buf + parser->current_rom_index, line->data,
+               line->byte_count);
+        parser->current_rom_index += line->byte_count;
+        parser->total_size += line->byte_count;
+        /* save next address to write */
+        parser->next_address_to_write =
+            parser->current_address + line->byte_count;
+        break;
+
+    case EOF_RECORD:
+        if (parser->current_rom_index != 0) {
+            rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
+                                  parser->current_rom_index,
+                                  parser->rom_start_address, parser->as);
+        }
+        return parser->total_size;
+    case EXT_SEG_ADDR_RECORD:
+    case EXT_LINEAR_ADDR_RECORD:
+        if (line->byte_count != 2 && line->address != 0) {
+            return -1;
+        }
+
+        if (parser->current_rom_index != 0) {
+            rom_add_blob_fixed_as(parser->filename, parser->bin_buf,
+                                  parser->current_rom_index,
+                                  parser->rom_start_address, parser->as);
+        }
+
+        /* save next address to write,
+         * in case of non-contiguous block of memory */
+        parser->next_address_to_write =
+            line->record_type == EXT_SEG_ADDR_RECORD
+                ? ((line->data[0] << 12) | (line->data[1] << 4))
+                : ((line->data[0] << 24) | (line->data[1] << 16));
+        parser->rom_start_address = parser->next_address_to_write;
+        parser->current_rom_index = 0;
+        break;
+
+    case START_SEG_ADDR_RECORD:
+        if (line->byte_count != 4 && line->address != 0) {
+            return -1;
+        }
+
+        /* x86 16-bit CS:IP segmented addressing */
+        *(parser->start_addr) = (((line->data[0] << 8) | line->data[1]) << 4) |
+                                (line->data[2] << 8) | line->data[3];
+        break;
+
+    case START_LINEAR_ADDR_RECORD:
+        if (line->byte_count != 4 && line->address != 0) {
+            return -1;
+        }
+
+        *(parser->start_addr) = (line->data[0] << 24) | (line->data[1] << 16) |
+                                (line->data[2] << 8)  | (line->data[3]);
+        break;
+
+    default:
+        return -1;
+    }
+
+    return parser->total_size;
+}
+
+/* return size or -1 if error */
+static int parse_hex_blob(const char *filename, hwaddr *addr, uint8_t *hex_blob,
+                          size_t hex_blob_size, AddressSpace *as)
+{
+    bool in_process = false; /* avoid re-enter and
+                              * check whether record begin with ':' */
+    uint8_t *end = hex_blob + hex_blob_size;
+    uint8_t our_checksum = 0;
+    uint32_t record_index = 0;
+    HexParser parser = {
+        .filename = filename,
+        .bin_buf = g_malloc(hex_blob_size),
+        .start_addr = addr,
+        .as = as,
+    };
+
+    rom_transaction_begin();
+
+    for (; hex_blob < end; ++hex_blob) {
+        switch (*hex_blob) {
+        case '\r':
+        case '\n':
+            if (!in_process) {
+                break;
+            }
+
+            in_process = false;
+            if ((LEN_EXCEPT_DATA + parser.line.byte_count) * 2 !=
+                    record_index ||
+                our_checksum != 0) {
+                parser.total_size = -1;
+                goto out;
+            }
+
+            if (handle_record_type(&parser) == -1) {
+                parser.total_size = -1;
+                goto out;
+            }
+            break;
+
+        /* start of a new record. */
+        case ':':
+            memset(&parser.line, 0, sizeof(HexLine));
+            in_process = true;
+            record_index = 0;
+            break;
+
+        /* decoding lines */
+        default:
+            if (!parse_record(&parser.line, &our_checksum, *hex_blob,
+                              &record_index, in_process)) {
+                parser.total_size = -1;
+                goto out;
+            }
+            break;
+        }
+    }
+
+out:
+    g_free(parser.bin_buf);
+    rom_transaction_end(parser.total_size != -1);
+    return parser.total_size;
+}
+
+/* return size or -1 if error */
+int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as)
+{
+    gsize hex_blob_size;
+    gchar *hex_blob;
+    int total_size = 0;
+
+    if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL)) {
+        return -1;
+    }
+
+    total_size = parse_hex_blob(filename, entry, (uint8_t *)hex_blob,
+                                hex_blob_size, as);
+
+    g_free(hex_blob);
+    return total_size;
+}
-- 
2.17.1


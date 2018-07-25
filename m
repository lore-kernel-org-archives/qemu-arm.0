Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp468483wru;
        Wed, 25 Jul 2018 02:03:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf2TBmm5Geh+yPZa13vctz6kyBIpZZln9GyqW6FW3pisS53IZyO7Ux+phFjP+PCbaLUjxma
X-Received: by 2002:a37:9b83:: with SMTP id d125-v6mr18041656qke.127.1532509417714;
        Wed, 25 Jul 2018 02:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509417; cv=none;
        d=google.com; s=arc-20160816;
        b=OJYGLuUEnnjEexCNgS0HBRl7+IeLzKkZe2ZTkOZkrbRKuzFfN9KRa8DAKSVlrv8dax
         mMR217tkNPcVOETuzfKNePtlJyNT9A84uXne6jOUmdZ3ArZRKD9OhGClIK1neGkPQhV3
         u6IQD/SdPbucIyI2V4AIYpMW6i+Q4dWQcaV984TPvFbAQgllSvFO3xaajroKo3xk2/DH
         xSfGAJE131m/XQEwiKJWt2RXiMl0tZ+oBDWqTzk4vU0aq+izUCSwgD9UPIkXDLeJsk9I
         Uzhx8Ec0mNqU5W2kHDW83rLEu58Mog3fVaV78SOJCvs2lMV5KXtYFLEO6u8Q883umd2v
         +4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iKMRK5n/9L/PE3h/WRwTuia6EoFeabKu4tc4YWOYeUM=;
        b=ECWosDZo6LkYW+YK2ekvFL8FGAvFH2Hssr+RgyG2iMmLTWo51jPACl+WWDcrfV1Hsl
         CAsDjpjS4PREj6/DsJ9QN5+crguNI8QQBEYuLlhXMAGZqz/UHrro8757artBuS9QKZ5F
         J+OdQsPAu+jOzrg5G8MGQmk56omYWtWXCcTIL2s6RbxKU3TKUjyOsWF3KIjea+Fj1ZLE
         hRMyBer2eGdP4FiowmwIGzz4fM9X8ueRhCO2WR7bs1xsTztyCiyROhEkR2RRPoBdNNg9
         aU11Hm4hToWrxj/dbnSazcur+qwRGAJjYIyRVPf200tK7Yfi1LcrYGQWfmMmGRI32U5w
         ztQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q17-v6si14435766qtf.187.2018.07.25.02.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 02:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiFhp-0002qv-4V
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 05:03:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeR-0008DX-HF
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeO-0002Ji-JJ
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33512 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fiFeO-0002HI-Ch; Wed, 25 Jul 2018 05:00:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D19BE81A4EBF;
	Wed, 25 Jul 2018 09:00:03 +0000 (UTC)
Received: from localhost (ovpn-117-157.ams2.redhat.com [10.36.117.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48803215670C;
	Wed, 25 Jul 2018 09:00:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Jul 2018 09:59:43 +0100
Message-Id: <20180725085944.11856-7-stefanha@redhat.com>
In-Reply-To: <20180725085944.11856-1-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 25 Jul 2018 09:00:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 25 Jul 2018 09:00:03 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 6/7] loader: Implement .hex file loader
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
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XG7Xe2IBfT2r

From: Su Hang <suhang16@mails.ucas.ac.cn>

This patch adds Intel Hexadecimal Object File format support to the
loader.  The file format specification is available here:
http://www.piclist.com/techref/fileext/hex/intel.htm

This file format is often used with microcontrollers such as the
micro:bit, Arduino, STM32, etc.  Users expect to be able to run them
directly with qemu -kernel program.hex instead of converting to ELF or
binary.

Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/loader.h    |  12 ++
 hw/arm/arm-m-profile.c |   3 +
 hw/core/loader.c       | 243 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)

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
diff --git a/hw/arm/arm-m-profile.c b/hw/arm/arm-m-profile.c
index 8bafd6602d..441bc1a9c2 100644
--- a/hw/arm/arm-m-profile.c
+++ b/hw/arm/arm-m-profile.c
@@ -302,6 +302,9 @@ void arm_m_profile_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem
     if (kernel_filename) {
         image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
                                  NULL, big_endian, EM_ARM, 1, 0, as);
+        if (image_size < 0) {
+            image_size = load_targphys_hex_as(kernel_filename, &entry, as);
+        }
         if (image_size < 0) {
             image_size = load_image_targphys_as(kernel_filename, 0,
                                                 mem_size, as);
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 182abcce28..9ce5f45d5c 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1323,3 +1323,246 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict)
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

